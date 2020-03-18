Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 899721896ED
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 526A2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8741C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HSRH019406; Wed, 18 Mar 2020 09:25:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Z17Unk4PzgoKc74xqE5FBWvdpsNxgEYr1I28IFk4bns=;
 b=KNhQY8fvloSicb2D71foqqPe/Os6uoPMhbt1DGvEyTG2DNZSZIf2GkQ47bjtqXlf+ZTu
 OpJ4Nr5q7+ChWUNqO/0n0idnqVyCQbRYemVZBtuGta+9H6Q9t6FiHdCffQynSQhGjOP5
 g4pXPqdZgtC2KT7edc5js/B5IJVG8eSWh43AYQinmG+nvzljoYdTxn75k3rz3eBOYVo+
 NiRbRjVqYJ5EIBCiMByUeY7KB6Pa9zA+Jew3+okSgxo6ofbq+QKinUTFHQn+jbXWrmtz
 0wOkXiRAoHYBkXfjqaeg0vAWXZx7DNU0AiNgpeVgQVF2x4JkPn/AjVs9EVlHlJqc9fdS +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C45C7100038;
 Wed, 18 Mar 2020 09:25:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AFFFF21CA95;
 Wed, 18 Mar 2020 09:25:07 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:07 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:47 +0100
Message-ID: <20200318082503.8025-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Brad Campbell <bradjc5@gmail.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 02/18] dfu: add prototype for
	dfu_transaction_initiate/cleanup
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

Add prototype for function dfu_transaction_initiate and
dfu_transaction_cleanup to avoid warning with W=1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/dfu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dfu.h b/include/dfu.h
index fb5260d903..2f0e335ec0 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -209,6 +209,9 @@ void dfu_initiated_callback(struct dfu_entity *dfu);
  */
 void dfu_flush_callback(struct dfu_entity *dfu);
 
+int dfu_transaction_initiate(struct dfu_entity *dfu, bool read);
+void dfu_transaction_cleanup(struct dfu_entity *dfu);
+
 /*
  * dfu_defer_flush - pointer to store dfu_entity for deferred flashing.
  *		     It should be NULL when not used.
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
