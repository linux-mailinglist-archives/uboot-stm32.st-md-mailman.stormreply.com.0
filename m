Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C5670E7
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 16:01:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40348D40C1A
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:01:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B12ED40C18
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 14:01:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CDvN44025590; Fri, 12 Jul 2019 16:01:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VPWXFeCZklByjSaE6PE4HGfuFE3ZVXEut67nryQ3wYo=;
 b=1lKrQfbEv72EYSbRNOTBmqIq+iOMkjyobXInNiYvphCRExSq4ySTP8aYJbz9imMhoVtq
 9bjjpAoHfQtjcl7wCUY3Q+WBANb2DSHpg70vsLtMZ12GTM9ggeir6+j/aDvsrKL9uUHy
 qtkTrHarH5oMyl7Xkw3VlzeMAFXaicFXd7RzfDpmk7WvQyQJXifmWDRp0kGwPx004bMA
 TQcw69IVptUjKKhGPBCcihlkWDAuUtG07bGKn3b8nCHGbwpMxT7yj3BCJp8OHm8FFPMm
 wJm24lJpwKgQOWDe72kqnu01DCtAwO10YnBiMwFiZWhjwMwsYhH+TgPOFoHVtYUkUsT8 Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjgsajhdf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 16:01:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AD1141;
 Fri, 12 Jul 2019 14:01:20 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E2FE4E4E;
 Fri, 12 Jul 2019 14:01:20 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 12 Jul
 2019 16:01:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 16:01:19 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/20] i2c: stm32f7_i2c: Fix warnings when compiling with
 W=1
Thread-Index: AQHVKDUI9WWmLANcdkeh93IydjP3HabHIvng
Date: Fri, 12 Jul 2019 14:01:19 +0000
Message-ID: <084848a939b346c0b36995c4e01e9c75@SFHDAG6NODE3.st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-9-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1561123618-2029-9-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/20] i2c: stm32f7_i2c: Fix warnings when
 compiling with W=1
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

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 21 juin 2019 15:27
> 
> This patch solves the following warnings:
> 
> drivers/i2c/stm32f7_i2c.c: In function 'stm32_i2c_compute_solutions':
> warning: comparison between signed and unsigned integer expressions [-Wsign-
> compare]
>     if (scldel < scldel_min)
>                ^
> warning: comparison between signed and unsigned integer expressions [-Wsign-
> compare]
>      if (((sdadel >= sdadel_min) &&
>                   ^~
> warning: comparison between signed and unsigned integer expressions [-Wsign-
> compare]
>           (sdadel <= sdadel_max)) &&
>                   ^~
> drivers/i2c/stm32f7_i2c.c: In function 'stm32_i2c_choose_solution':
> warning: comparison between signed and unsigned integer expressions [-Wsign-
> compare]
>       if (clk_error < clk_error_prev) {
>                     ^
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/i2c/stm32f7_i2c.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
