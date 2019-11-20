Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7441037CA
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 11:44:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB21C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 10:44:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4399DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:44:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKARPV6011381; Wed, 20 Nov 2019 11:44:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=y+fSKJuMrbx9n/s/f6eXzAh2tEqZX/2yAqyNsNPFp4A=;
 b=i6kl6zJsEYHh17RiilMM7VJWXTlLAeT2CppXhMpDpB0tHz8svtr/Bf1d7KgM0zJ011cI
 P6DFYk1xoJImrpmM4ShrhvxDH/6Een1/CNvpRmy49jN8RWL5LXYIRPGyFJ/LrRyIMUGW
 6IaeAS/hS9Ps/36kqXakSxrBQpf2HEusZOzURII6bhvWqM7E4Y877Fn2yedKrLi/wHwU
 JuxG3dEEE6qqselXxnE1zIs0Hobw+IJfXpWNODM47Rg5nsRWSWsmuVSORBAKkxuSyUXA
 uOCUWgy3gu565WqwtgH0zbUCgZeZfWgcTC2lLKSO0J2Ve7oq8zEZwKZ92m3botDwZRX3 eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9uvdg2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:44:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DACC100038;
 Wed, 20 Nov 2019 11:44:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CF7A2BE235;
 Wed, 20 Nov 2019 11:44:26 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 20 Nov 2019 11:44:25 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Nov 2019 11:44:16 +0100
Message-ID: <20191120104418.1179-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_02:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 0/2] Fix BMP decode when BMP size is bigger
	than framebuffer
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


This series is fixing 2 issues found when trying to decode BMP
bigger than the framebuffer:
 - video_splash_align_axis() must calculate the absolute value of
   difference between panel_size and picture_size.
 - Don't rely on BMP's width and height but in width and height
   value computed by video_bmp_display().



Patrice Chotard (2):
  video: bmp: Fix video_splash_align_axis()
  video: bmp: Fix video_display_rle8_bitmap()

 drivers/video/video_bmp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
