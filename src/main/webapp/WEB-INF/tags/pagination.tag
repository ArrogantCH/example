<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="url" type="java.lang.String" required="true"%>
<%@ attribute name="queryString" type="java.lang.String" required="false"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false"%>

 <c:set var="qs" value="${fn:substring(queryString, 0, fn:indexOf(queryString, '&page='))}"></c:set>
    <c:choose>
        <c:when test='${fn:indexOf(url, "?") lt 0}'>
            <c:set var="url" value="${url }?${qs}&"/>
        </c:when>
        <c:otherwise>
            <c:set var="url" value="${url }&${qs}&"/>
        </c:otherwise>
    </c:choose>
<c:if test="${p.totalPages > 0 }">
	<ul class="pagination pagination-sm no-margin ${cssClass }">
		<c:choose>
			<c:when test="${page.first}">
				<li class="disabled"><a href="#">Prev</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${url }p=${page.number - 1 }">Prev</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${p.totalPages <= 3 }">
				<c:forEach var="idx" begin="0" end="${page.totalPages - 1 }">
					<c:choose>
						<c:when test="${idx eq page.number }">
							<li class="active"><a href="#">${idx + 1 }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${url }p=${idx }">${idx + 1 }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${page.totalPages - page.number  <= 3 }">
						<c:forEach var="idx" begin="${page.totalPages - 4 }" end="${page.totalPages - 2 }">
							<c:choose>
								<c:when test="${idx eq page.number }">
									<li class="active"><a href="#">${idx + 1 }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${url }p=${idx }">${idx + 1 }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="idx" begin="${page.number }" end="${page.number + 2 }">
							<c:choose>
								<c:when test="${idx eq page.number }">
									<li class="active"><a href="#">${idx + 1 }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${url }p=${idx }">${idx + 1 }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<li><span>...</span></li>
				<c:choose>
					<c:when test="${page.totalPages-1 eq page.number }">
						<li class="active"><a href="${url }p=${page.totalPages  }">${page.totalPages }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${url }p=${page.totalPages  }">${page.totalPages }</a></li>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${page.last}">
				<li class="disabled"><a href="#">Next</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${url }p=${page.number + 1 }">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</c:if>
