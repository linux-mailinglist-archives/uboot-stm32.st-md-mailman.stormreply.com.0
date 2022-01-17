Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C03B490BBE
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jan 2022 16:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6245C5C83D;
	Mon, 17 Jan 2022 15:49:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34063C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 15:49:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HCuI73003013;
 Mon, 17 Jan 2022 16:49:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qteTFag3sxkUfPRMHyzc7TnauB/xUzo027Og7oXOsZE=;
 b=f/XbVrtdVhFEiZqX/PXYqWYtP8u2jCbfNlEbF0oSYd/k8oqZkDKMAO1XfCAsSvDVegAD
 SWvcB/vcFbJDhA8L++f0Qqpz3cllJe3fl4w5hJiGX8TVdYUQGGX5BBpSWm3E6vYx3yLj
 ZfGWodj0P/THqH4vCCIhLcw9rFiSraYsOaIQBE6tcP6WRmGzfSA0d1ExL3SmLK+vl8CE
 v++tLzn1Kz9lxLRnqYtmVwt5iiDp4UumshD6TQSKNwb4mQySFhdHcoL6bfqRuNsTGoR5
 3XHHrr+Zzdb79qZUNLGCtMWXnBJ30GGxhCt0OePYrYrdqBBje/FJV/KZhD/nKNQH5N2I Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmq5g5fvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 16:49:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25CD5100034;
 Mon, 17 Jan 2022 16:49:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EFD521E670;
 Mon, 17 Jan 2022 16:49:28 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 16:49:27
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 17 Jan 2022 16:49:20 +0100
Message-ID: <20220117164919.v2.1.Id4243a671034f3f7b464dc2753bf03a33ccdd60c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
References: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 1/3] dm: fix up documentation for
	uclass_get_by_name_len
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

Fix up the comment for uclass_get_by_name_len() to avoid confusion.

Fixes: 4b030177b660 ("dm: core: Allow finding children / uclasses by partial name")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/dm/uclass.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dm/uclass.h b/include/dm/uclass.h
index f1fd2ba246..a606b6a20b 100644
--- a/include/dm/uclass.h
+++ b/include/dm/uclass.h
@@ -173,10 +173,10 @@ int uclass_get(enum uclass_id key, struct uclass **ucp);
 const char *uclass_get_name(enum uclass_id id);
 
 /**
- * uclass_get_by_name() - Look up a uclass by its driver name
+ * uclass_get_by_name_len() - Look up a uclass by its partial driver name
  *
  * @name: Name to look up
- * @len: Length of name
+ * @len: Length of the partial name
  * @returns the associated uclass ID, or UCLASS_INVALID if not found
  */
 enum uclass_id uclass_get_by_name_len(const char *name, int len);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
