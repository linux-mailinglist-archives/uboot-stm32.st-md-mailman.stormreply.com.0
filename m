Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDFA66CBB
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 14:23:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C3FFD3FD42
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jul 2019 12:23:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E4E8D3FD41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jul 2019 12:23:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6CCLYPk022202; Fri, 12 Jul 2019 14:23:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uZBvd1gn2h2B54SBdzM8sHlomttryw+eaRtYjLaJW6E=;
 b=kjYSji1wkEbt+cS/UYd1nUFG9NBa+QMVS7DA+xnOpTQbfHRGYwxAG+SnSygkd9Nn6Rh3
 e6yZCn8v7sqJATAp5vZ8hTh4fkeOgKh4uiD6yiQThOlsb6cp7oIESJ4Lw37/UM6dVHwb
 N+dfFJiIWmFAU3ekBCQE/bXeJNK1KdN5wLuy/PPDNAyzFhbcWNf4nZgvmUFCWAvyRQJ1
 zaWdRdAFWEyc6rdiaMMqWNJO3+Ba/ETeb1XRszOgiFjhLiDmrYew54Xrl0GjfeRC/I7c
 L+zty8iN5R+DjZPTdB8JDb3UcKWd5j6XJOa1oRSX3FrOhWMyzYEZM9uKMmZbWbr21eo3 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tpj3tjx9q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 12 Jul 2019 14:23:02 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B71B83A;
 Fri, 12 Jul 2019 12:23:01 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A106B2BA4;
 Fri, 12 Jul 2019 12:23:01 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Jul
 2019 14:23:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 12 Jul 2019 14:23:01 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 12/16] stm32mp1: cosmetic: remove unnecessary include
Thread-Index: AQHVM0U1NJn/gPaF3UeMQDE3HDMc56bG8WUw
Date: Fri, 12 Jul 2019 12:23:01 +0000
Message-ID: <b757bfa85f33460fb0ae4a2a8b880558@SFHDAG6NODE3.st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
 <1562340023-8516-13-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1562340023-8516-13-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 12/16] stm32mp1: cosmetic: remove
	unnecessary include
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
> Sent: vendredi 5 juillet 2019 17:20
> 
> Remove post.h include as it is used in spl.c
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  board/st/stm32mp1/spl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
