Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1E48B216
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jan 2022 17:27:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B99EEC5F1F7;
	Tue, 11 Jan 2022 16:27:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1F41C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 16:27:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20BBoEb8023994;
 Tue, 11 Jan 2022 17:27:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=d5ReydFNWf5C67sAMml8FrSkuOzOUu5PGeSCMvzVbz8=;
 b=0cjTF7DOSqiS964k2ASfhuouTtwkUi7yxovExal7QwyLX+7iIW9/Zg2wn2cTbaDtkY89
 XG0hMzis84CBysQXmLMqVcwt+qH1n71TAe4qXaVG1FPJUrfF4y+8G4Brt6w9acsI+TDh
 vXW/lZlhjRtZfa5fIsCl8O4A2il+Wra/o1vGArY1H1suOJLyWvpRDaQBeOupAckN+C+a
 fr20KXX+ccFihq5TwS1WpyJHAIKbheIc7msuzOoYE6FAUE9mO5+nAFMDtH9bPFvpNq10
 yYD8mvu9QtohZqTQlycJU2Ccvq2Qdg+UnlDWQHsFDH2BmO2nCY2YEz3VDSpMuaQS/cRK qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dh9cb99hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 17:27:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D37EF100034;
 Tue, 11 Jan 2022 17:27:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCDA2231237;
 Tue, 11 Jan 2022 17:27:15 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 11 Jan 2022 17:27:15
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Jan 2022 17:27:11 +0100
Message-ID: <20220111172710.1.Id4243a671034f3f7b464dc2753bf03a33ccdd60c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
References: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 1/3] dm: fix up documentation for
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
