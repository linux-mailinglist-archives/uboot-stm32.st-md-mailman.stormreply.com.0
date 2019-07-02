Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E925CE56
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 13:26:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE674C6A5EE
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 11:26:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76574C6A5EC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 11:26:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62BLSa5017835; Tue, 2 Jul 2019 13:26:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=FtGJdi7DrN0mJWfiwp9to3IN2mjWkexB2Op3s4an8ac=;
 b=rjp6L/P98Y3I6WWmPqVDGQ6oBAsGBa7cuQoYNcKy3VW65ik9bF7cojiOi5hDk01E9jGK
 wFRwuDt4K7bH9reMPiJB2tFuUfat4aMRIUb1ao71Bhh9YNKgpyXWF4lOn6va6MH5T6Bt
 P/iFqd7HmcFstYCSCjQOoEleOMw9AqsNMu+HzRh5g2HZ7YukTTb+7FNqIr8erJ8A00E+
 qtdwIaCTXHoWotHu360ctFNUluyVNIBudiMNi9Zg0O35J9ARX9kS7M6hb7KKTFKG8nST
 1tJODUtzjALt11GYzwI4M0GOPCVqKj5shxP8ICkjqaOPYr4AcDM/D9ye9d0Vc8CiHrzj hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvhucmg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 13:26:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15A5831;
 Tue,  2 Jul 2019 11:26:13 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEE9727FF;
 Tue,  2 Jul 2019 11:26:12 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 13:26:12 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 13:26:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Jul 2019 13:26:04 +0200
Message-ID: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 0/3] stm32mp1: add OP-TEE configuration and
	associated MTD partitions
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


Added features for v2019.10
- Add Trusted boot chain with OP-TEE
- fixup of MTDPARTS in kernel device tree



Patrick Delaunay (3):
  stm32mp1: reorder some CONFIG in stm32mp1.h
  stm32mp1: add configuration op-tee
  stm32mp1: activate OF_BOARD_SETUP and FDT_FIXUP_PARTITIONS

 arch/arm/mach-stm32mp/Kconfig       |  13 ++++-
 board/st/stm32mp1/MAINTAINERS       |   1 +
 board/st/stm32mp1/README            |  29 +++++++---
 board/st/stm32mp1/stm32mp1.c        |  22 +++++++-
 configs/stm32mp15_basic_defconfig   |   1 +
 configs/stm32mp15_optee_defconfig   | 104 ++++++++++++++++++++++++++++++++++++
 configs/stm32mp15_trusted_defconfig |   1 +
 include/configs/stm32mp1.h          |  30 ++++++++---
 8 files changed, 186 insertions(+), 15 deletions(-)
 create mode 100644 configs/stm32mp15_optee_defconfig

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
