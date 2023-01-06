Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25342660024
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 13:20:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C97FBC6905B;
	Fri,  6 Jan 2023 12:20:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B14EC640EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 12:20:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 306BJboD014996; Fri, 6 Jan 2023 13:20:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=4YVGBsQAMqUOMryiXXj08Zgv9RCI3Ipv71ZYjQ4CfLw=;
 b=ZPCvM5k4nJvwA0quqn+iZieeWPmF3emqdmstHRNw78dsiIRxW1JD2SeQyDMR27G8c7G0
 GdCIYy+ewm481h+LD7BhzmDnWYjboMidTdbaD87EgfEnhLd9Emnvo0GNgijVMgZqwx0Y
 x5+95jie0KGwmUXCr3JiwYNRfrYWXTJc1BRvwUvjgWvobR5lpmO4uTdRvsXks8KKpPlh
 eirZL8soYIrfi8QRzVvvHJXyZgkh244lD7MDoMLpsEwoCRuDFy3zQLKiFg9aPV6sdDTB
 0kMsUhu+9qcfqhSRk2LhzEzRWJVYTclGRotikFmp+9O+tQFD2VzTBnQETC+qHBRQ5HsU Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mx41mn3xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 13:20:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A983C10002A;
 Fri,  6 Jan 2023 13:20:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DB812088F6;
 Fri,  6 Jan 2023 13:20:26 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 6 Jan
 2023 13:20:26 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Jan 2023 13:20:13 +0100
Message-ID: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_06,2023-01-06_01,2022-06-22_01
Cc: Vikas Manocha <vikas.manocha@st.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/6] stm32mp: Add support of OP-TEE and
	STM32MP13x in bsec driver
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


Add support of STM32MP13x in bsec driver with OP-TEE pseudo TA
and activate the associated commands fuse, stboard and stm32key.

This PTA is merged in OP-TEE master branch, and can be used
for STM32MP15X and STM32MP13X SoC to access to BSEC secured ressource.

This serie is a preliminary step for STM32MP13x USB support,
with serial number and for ETH with mac address.

Patrick


Patrick Delaunay (6):
  stm32mp: cosmetic: Update of bsec driver
  stm32mp: Add OP-TEE support in bsec driver
  stm32mp: Add support of STM32MP13x in bsec driver
  configs: stm32mp13: Activate CONFIG_CMD_FUSE
  board: st: Add support of STM32MP13x boards in stm32board cmd
  configs: stm32mp13: Activate command stm32key

 arch/arm/mach-stm32mp/bsec.c              | 176 +++++++++++++++++++++-
 arch/arm/mach-stm32mp/cmd_stm32key.c      |   4 +-
 arch/arm/mach-stm32mp/include/mach/bsec.h |   7 +
 board/st/common/Kconfig                   |   2 +-
 board/st/common/cmd_stboard.c             |  12 +-
 configs/stm32mp13_defconfig               |   2 +
 doc/board/st/stm32mp1.rst                 |   6 +-
 7 files changed, 191 insertions(+), 18 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
