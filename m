Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D910E6DD
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Dec 2019 09:23:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F788C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Dec 2019 08:23:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D020C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 08:23:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB28I570024389; Mon, 2 Dec 2019 09:23:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PcNGFTGot3d2ajY7+kbVb+vQiNmy0Ggrygetex3/COE=;
 b=Wcha/6c1u/iMMFB0uVyBCsgk5YJ18vU/0heY5d4FGWq7QkOG9U5gqgNFRh20OJ8rl71I
 gstmnO+q4VYFzLv2Th96D1LvuveoF60Su8qFgRWgA6z2lLM4/u+KyhrIhzfW+WPBPBaJ
 hK78wk/P34daWj18Kl7Xq+pVINWKAlGJMd9HmwQC2Z7dFOv+G9P2atR2bfA7hV8KG2yP
 P2gUv3+mLZI+WmEaDpycZjCMSZbBQaaXHjmOQKYFu63pstELNGRMqd3VHWIS4ceedrVk
 RikLLqg90x97x3tChwUnWjaMm6ahxnrNi1z1XJDUmV19nOv9z2GDifpz4c67m/dFaVxa 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6k8bk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2019 09:23:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8E1B10002A;
 Mon,  2 Dec 2019 09:23:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 967452A8D26;
 Mon,  2 Dec 2019 09:23:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Dec
 2019 09:23:50 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 2 Dec 2019 09:23:51 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 0/2] Fix BMP decode when BMP size is bigger than
 framebuffer
Thread-Index: AQHVn6P/qVskU5O50UasrN68FPtCeKemg5oA
Date: Mon, 2 Dec 2019 08:23:51 +0000
Message-ID: <e0e2616e-c341-122c-03f0-d3ca8f85a8ef@st.com>
References: <20191120131116.20620-1-patrice.chotard@st.com>
In-Reply-To: <20191120131116.20620-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <D1DC22BEE8EF754E81F143ACFD7592D3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-01_04:2019-11-29,2019-12-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/2] Fix BMP decode when BMP size is
 bigger than framebuffer
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

Hi Anatolij

Just a reminder for this series which fixes stm32f746-disco boot when trying to display a splashcreen.

Thanks

Patrice

On 11/20/19 2:11 PM, Patrice Chotard wrote:
> This series is fixing 2 issues found when trying to decode BMP
> bigger than the framebuffer:
>  - Convert panel_picture_delta from unsigned long to long to insure
>    to store correctly the difference between panel_size and picture_size
>    in case the panel_size is smaller than picture_size.
>  - Don't rely on BMP's width and height but in width and height
>    value computed by video_bmp_display().
>
>
> Changes in v2:
>      - Convert panel_picture_delta from unsigned long to long
>
> Patrice Chotard (2):
>   video: bmp: Fix video_splash_align_axis()
>   video: bmp: Fix video_display_rle8_bitmap()
>
>  drivers/video/video_bmp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
