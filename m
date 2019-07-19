Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD966E5ED
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 14:57:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E608C030B7
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 12:57:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A256C06145
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 12:57:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCqjFq014622; Fri, 19 Jul 2019 14:57:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=UdFnnQC28CHz1RBPytxAfpUTZfrGFctfOI91XrIaJas=;
 b=wGw9j3y7Iign2GvcDYNDwxlLhRy+AOnXjTs0VE5cZ7zn8HQsEnMCM6Y0z3gCpOpTdUMO
 cYC8X4tR5vgpZ8Z0yMiIl47lSi2bGLpPJK9JQnTAvyEwy44jJwn1Z4GgqhqDH0+iv+Ay
 KQJuTjKprM++RS9aUKc6AM8Bbrgc9x99ndbwok6Yyk+73egNg7SYranjVlt+PeX3nFvx
 hrfto0ZW+l/GJlGK//DPbie5VyWQsQjzbIazNPLuAMqnVcninb34wPZbv6PqxfnMqqft
 UZpO2cKets1PWux0YRVqPw6FPwLYgvFHOAtUP8JujC63+4n/KJiWWniDn63GvY/yD3EY cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s28gv2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 14:57:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9B6C5C;
 Fri, 19 Jul 2019 12:57:29 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8A2A2D4F;
 Fri, 19 Jul 2019 12:57:29 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:29 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:29
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:12 +0200
Message-ID: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [RFC PATCH 00/14] dfu: update dfu stack and use them
	for stm32mp1
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


This serie based on v2019.07 propose some update on the DFU stack:
- add capability to have several DFU backend running in parallel
- add MTD backend for NAND, NOR or SPI-NAND
- add VIRTUAL backend for board/command specific behavior
- add some weak callback

To test the feature and as example, I update the stm32mp1
to use the new features (tested with command "dfu 0")

This serie prepares the DFU backend for communication with
STM32CubeProgrammer on stm32mp1 platform (stm32prog command).
This STMicroelectronics tool is based on DFU protocol and
update the boot devices and the OTPs on the ST boards.



Patrick Delaunay (14):
  dfu: cosmetic: cleanup sf to avoid checkpatch error
  dfu: sf: add partition support for nor backend
  dfu: prepare the support of multiple interface
  dfu: allow to manage DFU on several devices
  dfu: allow read with 0 data for EOF indication
  dfu: add backend for MTD device
  dfu: add partition support for MTD backend
  dfu: add DFU virtual backend
  dfu: add callback for flush and initiated operation
  stm32mp1: activate DFU support and command MTD
  stm32mp1: activate SET_DFU_ALT_INFO
  stp32mp1: configs: activate CONFIG_MTD_SPI_NAND
  stm32mp1: board: add spi nand support
  stm32mp1: add support for virtual partition read

 board/st/stm32mp1/README            | 111 +++++++++++++
 board/st/stm32mp1/stm32mp1.c        | 165 ++++++++++++++++++-
 cmd/dfu.c                           |  21 ++-
 configs/stm32mp15_basic_defconfig   |   6 +
 configs/stm32mp15_trusted_defconfig |   6 +
 drivers/dfu/Kconfig                 |  13 ++
 drivers/dfu/Makefile                |   2 +
 drivers/dfu/dfu.c                   | 145 +++++++++++++++--
 drivers/dfu/dfu_mtd.c               | 306 ++++++++++++++++++++++++++++++++++++
 drivers/dfu/dfu_sf.c                |  55 ++++++-
 drivers/dfu/dfu_virt.c              |  49 ++++++
 include/configs/stm32mp1.h          |  38 ++++-
 include/dfu.h                       |  51 ++++++
 13 files changed, 939 insertions(+), 29 deletions(-)
 create mode 100644 drivers/dfu/dfu_mtd.c
 create mode 100644 drivers/dfu/dfu_virt.c

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
