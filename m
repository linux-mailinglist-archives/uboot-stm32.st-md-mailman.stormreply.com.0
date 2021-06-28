Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CF3B5E7D
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:56:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F400C57196;
	Mon, 28 Jun 2021 12:56:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AB94C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:56:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCqUMX024918; Mon, 28 Jun 2021 14:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=oJXS1OQEuEVp/aHQt4AlYG5361T0+dJ7xtK6+g/uejQ=;
 b=SO/KT6V8uARLOSNdw3Du78JsF2i6e0P9YpRcUBwOD1Lgcqx6E+b3LdJbf5r+nca+P6ZT
 xwl+IHwUDP6/ZmEKcEHMlnWJVPSs5c+n1bKoSkwaVhdZzEm8rsFBAGPAQsTJhWB0H5Uw
 7k+j3VVp60/iw6EV8sWGb/ukX1lvs/r65AjTeOowo1hIHZsIrzQLIogYje4UwXUaJx27
 3J+53phdr4ZiQtzzfER8ySwJDa82P4cSTIOCtq7ikoYEz5MrDP0QbshQVlcioYuvJsJt
 +QebxDuDJiJwG+EZtWss1emUz7yXfJR1cf3OQAq7M6F1KiK2Gwh2m+JAKgX8s26LP91+ cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39f94c2fnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:56:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C6C710002A;
 Mon, 28 Jun 2021 14:56:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 035102291B7;
 Mon, 28 Jun 2021 14:56:09 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:56:08
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:55:56 +0200
Message-ID: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/7] stm32mp: cmd_stm32key: updates
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


Several improvements and protection on the command stm32key.

This command is used to experiment the secure boot on STM32MP15x;
the expected sequence to manually activate it with this U-Boot command is:
- Key generation with STM32 KeyGen tool
- Key registration: update and lock PKH in OTP (stm32key fuse)
- Perform image authentication of an image signed with
  STM32 Signing tool and check that the ROM code accepted them
- Close the device, only signed binary will be accepted (stm32key close)

Warning: Make sure that a device with Secure boot enabled is used,
         check the security field of the chip part number.

Otherwise the chip will be bricked and could not be used anymore.

This command is activated by default on STMicroelectronics evaluation
boards but these OTP can also be updated directly by customer
application or with Secure Secret Provisioning (SSP).



Patrick Delaunay (7):
  stm32mp: configs: activate the command stm32key only for ST boards
  stm32mp: cmd_stm32key: use sub command
  stm32mp: cmd_stm32key: handle error in fuse_hash_value
  stm32mp: cmd_stm32key: lock of PKH OTP after fuse
  stm32mp: cmd_stm32key: add get_misc_dev function
  stm32mp: cmd_stm32key: add read OTP subcommand
  stm32mp: cmd_stm32key: add subcommand close

 arch/arm/mach-stm32mp/Kconfig        |   4 +-
 arch/arm/mach-stm32mp/cmd_stm32key.c | 239 +++++++++++++++++++++++----
 configs/stm32mp15_basic_defconfig    |   1 +
 configs/stm32mp15_trusted_defconfig  |   1 +
 4 files changed, 208 insertions(+), 37 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
