Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF02D7736
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Dec 2020 14:59:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32A86C3FADB;
	Fri, 11 Dec 2020 13:59:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A37DFC3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Dec 2020 13:59:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BBDq3M4032074; Fri, 11 Dec 2020 14:59:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=FXWdOJXBglbWEMavjkjm91FZhoCYcWF4czcrCZDmwaM=;
 b=z9fQmscuQPObYJXhilR+fsoJf5l6QWeaIGPUd3neiWtE8kDtqU1aoOAEvyg93KZW3UD1
 rFzyR0mvZ8K2rAPmbo3JjVCuaS9RG2HYhAlHl1tg/1KuPGps8ULHcGgLGrkDSKAaVod8
 jni0YmMBSEWh5OJ6RAp6zYqmvnXDVIbAKMJ/bIANc7NRS3xHfJ/okkA67G4+R0VDOWTx
 y6lmy2xuBG/RYwwpx5RfWqezMxmfXpAt1BgZSfk9DLJu3yyv2/DoQG3SV3H62jW9n8oM
 2Umk//Qit4hXXPkLxuwoqVeys67KwMtIW/powPoG5MN8hrb/7FENFl5eaKBqwkCaZVVd 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35ag8jjfe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 14:59:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9976010002A;
 Fri, 11 Dec 2020 14:59:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33C9D26FD08;
 Fri, 11 Dec 2020 14:59:39 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec 2020 14:59:39
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Dec 2020 14:59:23 +0100
Message-ID: <20201211145635.v2.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_02:2020-12-11,
 2020-12-11 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2] string: Use memcpy() within memmove() when
	we can
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

A common use of memmove() can be handled by memcpy(). Also memcpy()
includes an optimization for large sizes: it copies a word at a time. So
we can get a speed-up by calling memcpy() to handle our move in this case.

Update memmove() to call also memcpy() if the source don't overlap
the destination (src + count <= dest).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

V2 of http://patchwork.ozlabs.org/project/uboot/list/?series=216620

This patch allows to save 38ms for Kernel Image extraction (7327624 Bytes)
from FIT loaded at 0xC2000000 for ARMV7 board STM32MP157C-EV1,
and with kernel destination = Load Address: 0xc4000000,
located after the FIT without overlap, compared with
destination = Load Address: 0xc0008000.

-> 14,332 us vs 52,239 in bootstage report

In this case the memmove funtion is called in common/image.c::memmove_wd()
to handle overlap.

Patrick

Changes in v2:
- Add a comment on potential issue if the memcpy is not doing a
  forward-copying

 lib/string.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/string.c b/lib/string.c
index ae7835f600..73b984123d 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -567,7 +567,19 @@ void * memmove(void * dest,const void *src,size_t count)
 {
 	char *tmp, *s;
 
-	if (dest <= src) {
+	if (dest <= src || (src + count) <= dest) {
+	/*
+	 * Use the fast memcpy implementation (ARCH optimized or lib/string.c) when it is possible:
+	 * - when dest is before src (assuming that memcpy is doing forward-copying)
+	 * - when destination don't overlap the source buffer (src + count <= dest)
+	 *
+	 * WARNING: the first optimisation cause an issue, when __HAVE_ARCH_MEMCPY is defined,
+	 *          __HAVE_ARCH_MEMMOVE is not defined and if the memcpy ARCH-specific
+	 *          implementation is not doing a forward-copying.
+	 *
+	 * No issue today because memcpy is doing a forward-copying in lib/string.c and for ARM32
+	 * architecture; no other arches use __HAVE_ARCH_MEMCPY without __HAVE_ARCH_MEMMOVE.
+	 */
 		memcpy(dest, src, count);
 	} else {
 		tmp = (char *) dest + count;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
