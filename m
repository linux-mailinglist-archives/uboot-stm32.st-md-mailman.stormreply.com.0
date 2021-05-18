Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDAC38799C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E681C57B7D;
	Tue, 18 May 2021 13:12:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F164C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDBwcu024369; Tue, 18 May 2021 15:12:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=eBt/0byGKlEVgZTsXcChi72UlK2cqLON/3KwMGywEyY=;
 b=x+8s/TyhcKvSqJxlkE/YbVIHCS3IZP+CByjOrH01zv9xIIl7ymt0sQjdiZesiJPNEuNo
 HBVCmuVistzr4HfpHTggVRfE/32eilatTaJJQsfOELpj2pIJ0iIl0N0EFdMYV7LRHrUK
 iy0EfO2DX+tljgCiZEJbqhJwb7ssI97ISUY/JeNyrhWcsQPjUNZMmTXFrDQdUP1g0jak
 jP0eHAVWroCLrbFkYft4sU1G4pwCsI7GiHPI6+m9Z4mXzlXkXQswWavK9/iDpJTnizm+
 /yosMndIwHZcBXSbBZHWy2x45aXDff8CNbKKe4pv5gpK7viAX65WtYzggDr2m2xltMsV 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38km707wn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFC5E100038;
 Tue, 18 May 2021 15:12:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43F112275E0;
 Tue, 18 May 2021 15:12:15 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:14
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:03 +0200
Message-ID: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 00/10] stm32mp: stm32prog: several features
	and fixes
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


This serie provides several evolution and patches for the
command stm32prog used on STM32MP platform to communicate
with the STMicroelectonics tools STM32CubeProgrammer.



Patrick Delaunay (10):
  stm32mp: stm32prog: remove all the header check for UART download
  stm32mp: stm32prog: add timeout in stm32prog_serial_get_buffer
  stm32mp: stm32prog: add support of initrd in flashlayout
  stm32mp: stm32prog: solve compilation with CONFIG_FIT_SIGNATURE
  stm32mp: stm32prog: handle the next phase after USB re-enumeration
  stm32mp: stm32prog: correctly handle DM_PMIC
  stm32mp: stm32prog: use get_cpu_dev for GetID command
  stm32mp: stm32prog: change one message level to debug
  dfu: add error callback
  stm32mp: stm32prog: handle dfu error

 .../cmd_stm32prog/cmd_stm32prog.c             |  26 ++-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  43 +++--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   7 +-
 .../cmd_stm32prog/stm32prog_serial.c          | 173 ++++--------------
 .../cmd_stm32prog/stm32prog_usb.c             |   7 +-
 drivers/dfu/dfu.c                             |  12 ++
 include/dfu.h                                 |  11 ++
 7 files changed, 108 insertions(+), 171 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
