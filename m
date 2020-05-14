Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC11D2B7E
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:33:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DAA9C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:33:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 342BCC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:33:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9X8wO004547; Thu, 14 May 2020 11:33:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ree5w6Ss2UcweUZSBIYDeOu/0VIh69alV+JPa0Hz+80=;
 b=x2+letSODt9fU09HB7mQI9umVXDNiTzJ4Q4VQKgNk5NhlWFo5JwPLpqFhfWetcTly1gF
 Fa5giP/DCPBlpEI+tlfy7yOklADJV8+yia4/EVQuvXj9V9PKbwxJF7AKHZQrdRivNq5f
 snHf8iSG5VrznX0Dnkcr54LSO2jprF1X3XUIRrX2t3cYCG1hW0aZn4/cCn47Rew+DkdZ
 r4S+ZbAlOev5fK8W8jEVsOVYnIQr/2hu7c+yHaFI+YITCnB7x2vZFZjBgmfkTLRk4wBY
 YcwPRGQBDOKpRPGofLYSOP5PN8fnL6HWECjk4GHjkpB56c6sLNAx3z7VClMxu5qOnHRv Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vyj940-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:33:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94010100034;
 Thu, 14 May 2020 11:33:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B4EA2AF944;
 Thu, 14 May 2020 11:33:06 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 11:33:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:33:06 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp1: Fix warning display when 1.5A power supply is
 used
Thread-Index: AQHWHw4nnUePVWod702ZhoG6gbhTZ6inZxbA
Date: Thu, 14 May 2020 09:33:06 +0000
Message-ID: <500a3dd41931447996cac9d06478d922@SFHDAG6NODE3.st.com>
References: <20200430164105.20486-1-patrice.chotard@st.com>
In-Reply-To: <20200430164105.20486-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: Fix warning display when 1.5A
 power supply is used
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

Hi Patrice

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: jeudi 30 avril 2020 18:41
> 
> On DK1/2 board, when a 1.5A power supply is detected, a warning message is
> displayed. In this message, "1.5mA" is displayed instead of "1.5A".
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
