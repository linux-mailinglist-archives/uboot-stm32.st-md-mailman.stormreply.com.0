Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CA10B06F
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 14:40:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3238BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 13:40:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA0E7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 13:40:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARDe47s032699; Wed, 27 Nov 2019 14:40:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LA1GLlhf0GuDaVvaaewc12qDHT437W4qglfPoOjotJ8=;
 b=en+rVaw8Pi2mTRS8UOFQ5VQKbXbW6SGcYjkSnMm2z5dPGS7ynkcLjZerFZ2mibRM2/u7
 vUfw0df2BvDobfAYQ1UtFgfg8Jjehp9e655uMaAlbrlOG5DyEzJYMh8YSWzgVeBSvg3v
 ahPNFC4isQVgmWKlKjwX+AybxVoQzezbnmy5rS9lzBMLn9ksc4bc4hLjqY+5ukmsW4Mf
 zDia4Remjtw0ZKeEvkoLkfZYefwJa69QM6wUy2FxODn0N+G31UA6m1uhfwfmD/ZcbcGd
 Vx0kBvd8UqdNoPc2qGsjvBISY0DiZKQbUTUcv2TrTNB7Qb70sA/GR1BJGzDiZuRxUSfA +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxj3u6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 14:40:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BAD610003A;
 Wed, 27 Nov 2019 14:39:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 412B52B9913;
 Wed, 27 Nov 2019 14:39:54 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 27 Nov
 2019 14:39:53 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 27 Nov 2019 14:39:53 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 13/15] stm32mp1: configs: activate CONFIG_MTD_SPI_NAND
Thread-Index: AQHVgmD9UWxcHgaobEChZOAKPZcvMqefS3HA
Date: Wed, 27 Nov 2019 13:39:53 +0000
Message-ID: <dff5c7e1679e461982d5b35eaac44369@SFHDAG6NODE3.st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
 <20191014072812.21843-14-patrick.delaunay@st.com>
In-Reply-To: <20191014072812.21843-14-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_03:2019-11-27,2019-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 13/15] stm32mp1: configs: activate
	CONFIG_MTD_SPI_NAND
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
> Sent: lundi 14 octobre 2019 09:28
> 
> Activate the support of SPI NAND in stm32mp1 U-Boot.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

-- 
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
