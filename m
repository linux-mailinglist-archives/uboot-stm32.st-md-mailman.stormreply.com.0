Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 093FA15AFF4
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCFCAC36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CDF6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIXwmR014893; Wed, 12 Feb 2020 19:38:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=ItjDcIsOCo6XuSUt0ZSqHUogjHxI26gLSROQCnAdcLw=;
 b=E8Q/mHmB5cPf9CUZmTT3T/jk3yOKVe0WCfrGsxWNd/r2wH7OiMlWtkobV2dcyqkDnNRb
 +/SYogQUriwjj4u5rcfc6vYfgB9/1IR7hB5rQilabdkE7MiiH693G4uKelOOZVj/JAhV
 4fB+JgyoLMzt3CeEn5utJHdWVhdJLnuhyFEob+0ype2Pihmv8z3YIynNLdbZVPkOxalD
 i/f4CpaZhuTsxvyhsX05ChuX3VIH5jksfBpMk97qHPta6b4fkzC4Qu2i5dxTtNWZAdZR
 DE0u8FXeX+MYCOwddb1/EEpn7qNDXoyPHYnfb/eEqi4SwpcayE+SSy9YZxv35AIIxzSC PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqtwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13353100038;
 Wed, 12 Feb 2020 19:37:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0801D2C60AA;
 Wed, 12 Feb 2020 19:37:47 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:46 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:34 +0100
Message-ID: <20200212183744.5309-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 00/10] stm32mp1: board and SOC identifications
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


Hi,

Few patches for board and SOC identifications on STM32MP15x
- update command stboard for STMicroelectronics board
  identification (MBxxxx with OTP 59)
- update kernel device tree with SOC part number

Regards

Patrick



Patrick Delaunay (10):
  board: stm32mp1: update command stboard on misc_write result
  board: stm32mp1: read OTP in command stboard
  arm: stm32mp: bsec: remove unneeded test
  arm: stm32mp: bsec: add permanent lock support in bsec driver
  board: stm32mp1: stboard: lock the OTP after programming
  arm: stm32mp: improve the error message for smc
  board: stm32mp1: add finished good in board identifier OTP
  board: stm32mp1: display reference only for STMicroelectronics board
  arm: stm32mp: add function get_soc_name
  arm: stm32mp: fdt: update kernel device tree according the part number

 arch/arm/mach-stm32mp/bsec.c                  |  92 +++++++++++-----
 arch/arm/mach-stm32mp/cpu.c                   |  20 ++--
 arch/arm/mach-stm32mp/fdt.c                   | 100 +++++++++++++++---
 arch/arm/mach-stm32mp/include/mach/stm32.h    |   9 +-
 .../mach-stm32mp/include/mach/stm32mp1_smc.h  |   5 +-
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   4 +
 board/st/common/cmd_stboard.c                 |  56 +++++++---
 board/st/stm32mp1/stm32mp1.c                  |  26 ++---
 doc/board/st/stm32mp1.rst                     |  34 ++++--
 9 files changed, 258 insertions(+), 88 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
