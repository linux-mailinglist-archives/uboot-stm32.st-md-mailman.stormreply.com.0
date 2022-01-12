Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7548C1B1
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 10:53:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82358C60461;
	Wed, 12 Jan 2022 09:53:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9921C60463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 09:53:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7J6IS019144;
 Wed, 12 Jan 2022 10:53:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YGUcV4aCm91AwvLNy7kH3v/vyewXAdzd4/AbWi+XaNk=;
 b=i2gE9Eb2qXak+mi9nqUTumlyqnOqmR61yf6Vk5M5YmFBdxisyI9gzc+Ejmmms1Xb9bkr
 uHQc41ASDytHLGqn4cNabZLLiAtv7te7cALTLgD9/Out9zbmdniTZ+j6B6SqCDV+2Sh8
 488u+V7wB9sjbRUEKkpuVwbrTDTm0TRhUo/5TCn8YJDT9qOOYLie3by290uw1TrfGQzQ
 yLnSUPmzEZGyDUF6w5wW5SgGARjNZlHlXyhA4HCVtZDu4cNiRsHMEE5fSrJBwt+4xfxx
 kBjF2n1o9CRcFnQS+fEqybjsFk88VUU6UULiBUwYm/nTqOZn1UJu5T0gVR1AmpWvFvlW kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtg9s2ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 10:53:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F08A10002A;
 Wed, 12 Jan 2022 10:53:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 387B12194F4;
 Wed, 12 Jan 2022 10:53:56 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 10:53:55
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 10:53:47 +0100
Message-ID: <20220112105327.6.I4a89fcecefb6ef68311639140e0d0ef51c7207ca@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 6/9] doc: add include/dm/devres.h to the HTML
	documentation
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

Correct Sphinx style comments in include/dm/devres.h
and add the driver model device resource API, devres_*(),
to the HTML documentation.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/api/dm.rst      |  1 +
 include/dm/devres.h | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/doc/api/dm.rst b/doc/api/dm.rst
index 7a77a91c1f..0342620786 100644
--- a/doc/api/dm.rst
+++ b/doc/api/dm.rst
@@ -15,3 +15,4 @@ Device
 ------
 
 .. kernel-doc:: include/dm/device.h
+.. kernel-doc:: include/dm/devres.h
diff --git a/include/dm/devres.h b/include/dm/devres.h
index 17bb1ee8da..0ab277ec38 100644
--- a/include/dm/devres.h
+++ b/include/dm/devres.h
@@ -51,7 +51,7 @@ void *_devres_alloc(dr_release_t release, size_t size, gfp_t gfp);
  * with @release.  The returned pointer can be passed to
  * other devres_*() functions.
  *
- * RETURNS:
+ * Return:
  * Pointer to allocated devres on success, NULL on failure.
  */
 #define devres_alloc(release, size, gfp) \
@@ -87,7 +87,7 @@ void devres_add(struct udevice *dev, void *res);
  * and for which @match returns 1.  If @match is NULL, it's considered
  * to match all.
  *
- * @return pointer to found devres, NULL if not found.
+ * Return: pointer to found devres, NULL if not found.
  */
 void *devres_find(struct udevice *dev, dr_release_t release,
 		  dr_match_t match, void *match_data);
@@ -103,7 +103,7 @@ void *devres_find(struct udevice *dev, dr_release_t release,
  * as @new_res and for which @match return 1.  If found, @new_res is
  * freed; otherwise, @new_res is added atomically.
  *
- * @return ointer to found or added devres.
+ * Return: pointer to found or added devres.
  */
 void *devres_get(struct udevice *dev, void *new_res,
 		 dr_match_t match, void *match_data);
@@ -120,7 +120,7 @@ void *devres_get(struct udevice *dev, void *new_res,
  * match all.  If found, the resource is removed atomically and
  * returned.
  *
- * @return ointer to removed devres on success, NULL if not found.
+ * Return: pointer to removed devres on success, NULL if not found.
  */
 void *devres_remove(struct udevice *dev, dr_release_t release,
 		    dr_match_t match, void *match_data);
@@ -140,7 +140,7 @@ void *devres_remove(struct udevice *dev, dr_release_t release,
  * only the devres-allocated data will be freed.  The caller becomes
  * responsible for freeing any other data.
  *
- * @return 0 if devres is found and freed, -ENOENT if not found.
+ * Return: 0 if devres is found and freed, -ENOENT if not found.
  */
 int devres_destroy(struct udevice *dev, dr_release_t release,
 		   dr_match_t match, void *match_data);
@@ -157,7 +157,7 @@ int devres_destroy(struct udevice *dev, dr_release_t release,
  * match all.  If found, the resource is removed atomically, the
  * release function called and the resource freed.
  *
- * @return 0 if devres is found and freed, -ENOENT if not found.
+ * Return: 0 if devres is found and freed, -ENOENT if not found.
  */
 int devres_release(struct udevice *dev, dr_release_t release,
 		   dr_match_t match, void *match_data);
@@ -173,7 +173,7 @@ int devres_release(struct udevice *dev, dr_release_t release,
  * automatically freed on driver detach.  Like all other devres
  * resources, guaranteed alignment is unsigned long long.
  *
- * @return pointer to allocated memory on success, NULL on failure.
+ * Return: pointer to allocated memory on success, NULL on failure.
  */
 void *devm_kmalloc(struct udevice *dev, size_t size, gfp_t gfp);
 static inline void *devm_kzalloc(struct udevice *dev, size_t size, gfp_t gfp)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
