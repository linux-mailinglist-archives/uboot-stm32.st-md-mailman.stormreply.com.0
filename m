Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887A1B4441
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:18:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1107C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:18:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A1F1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:18:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCECdl031949; Wed, 22 Apr 2020 14:18:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nK073kb2IW8eh/PjeFl59E45B1r0mZeSvKr3qiUjPHs=;
 b=lgN9I1KsQuOOwV6Bo/JTmWknV8oy6jsyGX710vJQrHRlq1yJr7tarwY8A4R6J7ohnj+R
 2JoLFmHY27mTnBwEQhtTsb0B6HBDVkY5xPTkwfLLPpV0LicakHeNuY9MG7Bj7sVyD5P/
 Yp6VPb9gx/iOpNQ1inqvdJee+wG3AGSxz2vE/vm1v9LnzZaC/p+rcbZOj/tlOh6hfJaX
 +elqDbUOAjHX4Im+/j4YMBpgJsZ8/PTmNCxpdXlQMyyQUitDxNGhv8cA8zall6jGOzbo
 uDRlZfQe9iYL8wA6a4KJiXsMQNHJkso/2sakf6ipEuAfh0VWRfb6MMOQh7FLcTY3X4tK ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11pap0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:18:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53D2E10002A;
 Wed, 22 Apr 2020 14:18:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F9332AE6AE;
 Wed, 22 Apr 2020 14:18:28 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:18:27 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:18:25 +0200
Message-ID: <20200422141755.1.I8b005c35223011e3c07122ccbf558bf8d27b6aab@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>, Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: [Uboot-stm32] [PATCH 1/2] net: tftp: Add help for
	CONFIG_TFTP_BLOCKSIZE
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

Add help message for the CONFIG_TFTP_BLOCKSIZE default value,
as explain in tftp.c before migration in commit b618b3707633
("net: Convert CONFIG_TFTP_BLOCKSIZE to Kconfig")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 net/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/Kconfig b/net/Kconfig
index 96bbce1778..ac6d0cf8a6 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -44,5 +44,9 @@ config TFTP_BLOCKSIZE
 	default 1468
 	help
 	  Default TFTP block size.
+	  The MTU is typically 1500 for ethernet, so a TFTP block of
+	  1468 (MTU minus eth.hdrs) provides a good throughput with
+	  almost-MTU block sizes.
+	  You can also activate CONFIG_IP_DEFRAG to set a larger block.
 
 endif   # if NET
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
