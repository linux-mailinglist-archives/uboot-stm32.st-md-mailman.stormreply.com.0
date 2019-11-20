Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F102103AC6
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 14:11:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 113C5C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 13:11:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFE91C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 13:11:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKD74DJ022364; Wed, 20 Nov 2019 14:11:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=qspdIKY+kX6ef8uoeZTATQ0fhnN/62cOt2KUWnv2Jsw=;
 b=WqNXrb4l2juUsII7aTTio1CWQk0p4epQ2AwTCmzG8xCD8orp9SRCwuLzZu5dpuj8r7j2
 8PdArwy9gXFo2hVkHPTBHMNu1Pi4GLynT0A1DuUcNAK8fJqxLfJZfTMRazJv3N8dX5Iw
 skufjz1L1UYOCTKYjByF6/be865oRvKtITtJGjX9PDPCThQu45E0PCoLn25IQkX+W80Z
 PqF29zqyVU8RzZi94SNbamk1QxmjFiq8OJFU9Azxax4nkQu+9RpGsupiKeBPF5Xh6zUs
 gjOGTay7RkWdwa9hb+/B076lns42zkuOoHDkamk8KA6Apz9nhj3YtJgwXEM1JKEhCYVy jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usdtva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 14:11:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A2DA10002A;
 Wed, 20 Nov 2019 14:11:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B6182FF5C4;
 Wed, 20 Nov 2019 14:11:19 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 20 Nov 2019 14:11:18 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Nov 2019 14:11:14 +0100
Message-ID: <20191120131116.20620-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 0/2] Fix BMP decode when BMP size is bigger
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
 - Convert panel_picture_delta from unsigned long to long to insure
   to store correctly the difference between panel_size and picture_size
   in case the panel_size is smaller than picture_size.
 - Don't rely on BMP's width and height but in width and height
   value computed by video_bmp_display().


Changes in v2:
     - Convert panel_picture_delta from unsigned long to long

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
