Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AA4E9D6C
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 19:25:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CD5CC5EC6B;
	Mon, 28 Mar 2022 17:25:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55C3EC5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:25:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDU7lL021069;
 Mon, 28 Mar 2022 19:25:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=ROxmN3w55waor7OwB+zLBEWqcxSjM76/zfjrst5ra+8=;
 b=h0wzzV+1dS+nmvaPKi9+bp99H8BIJY8R1I7dfini280SIo2NnNHkcAMRoQ78gttDWtkF
 9G2xePlToGQKLNaiTSiBgAVfQthg3NoL2fo4tIEEg6HUuqw7A1lJ9OJpHDhMcN0VHkua
 rtsdb88z2WAHMMqMFoxDSu0ky6dVARJmN42ES/yXaCOCOKM5DBYF5oLU1vY9BXqOAoJi
 p5W03kEYFMhcZ5JL20O7XB4vNeiGFFrArlvKi/EFfUO2XyCPryHq6PD1C567X4hROgMh
 8yvv4l57I5I954B71AHpXp8QaHOOnXnlv09QDmbMdTMx3JrjS5DyIYH8z7GDtoTEO1Qk yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1u242qpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 19:25:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44B9D10002A;
 Mon, 28 Mar 2022 19:25:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABEFD24B88F;
 Mon, 28 Mar 2022 19:25:36 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 19:25:36
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 19:25:25 +0200
Message-ID: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_08,2022-03-28_01,2022-02-23_01
Cc: Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 William Grant <wgrant@ubuntu.com>
Subject: [Uboot-stm32] [PATCH 0/8] stm32mp: command stm32prog improvements
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

Several patches to improve the command stm32prog command.
This command is used to program the STMicroelectronics boards with the
tools STM32CubeProgrammer and flashlayout file.


Patrick Delaunay (8):
  stm32mp: stm32prog: fix comment
  stm32mp: stm32prog: add CONFIG_CMD_STM32PROG_OTP
  stm32mp: stm32prog: add TEE support in stm32prog command
  stm32mp: stm32prog: add support of STM32IMAGE version 2
  stm32mp: stm32prog: add support of UUID for FIP partition
  stm32mp: stm32prog: handle interruption during the first enumeration
  stm32mp: stm32prog: handle U-Boot script in flashlayout alternate
  stm32mp: stm32prog: handle flashlayout without STM32 image header

 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   |   7 +
 .../cmd_stm32prog/cmd_stm32prog.c             |  13 +-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 418 ++++++++++++++----
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  47 +-
 .../cmd_stm32prog/stm32prog_usb.c             |   9 +-
 5 files changed, 378 insertions(+), 116 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
