Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563D2C3EB3
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 12:04:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31140C424AF;
	Wed, 25 Nov 2020 11:04:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01635C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 11:04:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APB2SHQ010636; Wed, 25 Nov 2020 12:04:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LjoBSUNAwHcYER4qUU7feRkkSVz9kzlnvYNloJmNzlU=;
 b=j4wehb6m4Z7Z9JrA4JMK1EH78SQ/9IMdMgJWUhdbsMZqvI+0QpSjFvZQXsmx8+QgPl1g
 7GYXCFo/AWiQ6mu/lVVqEbGU/msmWk7MIR0BxjNO+NC2m8COyvv55cEpbqJNGRX3vNen
 wt6l1cQHiHR09NYjLT95hTAD7mopEeWPSn8/I447Db4aso5PTyQUmkLjc0APGTR+2AxX
 vekHQS4d5X7ptAaXZoBguGRJoaT05LEnJi/vNquc9R2+WUhM3F39zfiHFS3hYvhwv8Mo
 lVB+0SfGkzKGZQ3JRBev6oG0vdtN+HCN/+L0Gh329YjtTx0BLNtdlj7UCGcBYQMCr1Ao Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hdhj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 12:04:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18FDB10002A;
 Wed, 25 Nov 2020 12:04:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E41F2383F2;
 Wed, 25 Nov 2020 12:04:16 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 12:04:15 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 12:04:15 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] phy: stm32: usbphyc: manage optional vbus regulator on
 phy_power_on/off
Thread-Index: AQHWovHVPT0sQn+iMkmHgzg9BH47DanY72ng
Date: Wed, 25 Nov 2020 11:04:15 +0000
Message-ID: <7445d37ef5134075853e56a10644d2c3@SFHDAG2NODE3.st.com>
References: <20201015125057.8037-1-patrick.delaunay@st.com>
In-Reply-To: <20201015125057.8037-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: stm32: usbphyc: manage optional vbus
 regulator on phy_power_on/off
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
> Sent: jeudi 15 octobre 2020 14:51
> 
> This patch adds support for optional vbus regulator.
> It is managed on phy_power_on/off calls and may be needed for host mode.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  .../phy/phy-stm32-usbphyc.txt                 |  2 ++
>  drivers/phy/phy-stm32-usbphyc.c               | 33 +++++++++++++------
>  2 files changed, 25 insertions(+), 10 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
