Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAAB1141C
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:27:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35E13C06B87
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 07:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21C73C0B783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 07:27:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x427Qm3Z008309; Thu, 2 May 2019 09:27:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=35DlGUiscoZduYHZrkoKyQ+NU77r526LnEW4jNHCmdE=;
 b=MINu3feiG2jeqDjJrmhAfvJhScEXLe3YNEaS+Sni6nwJbJbMFdO7kq2hk6rxKM4JkOet
 82+HPaMBAu4G91ShvklcVzOqR8ip2yc4Zy1SzvXH8+G79+Y8JHqI5kcA/EyolvDxPqj2
 gGyRPGsgVOXvtcF5NoupM6HvDU/Bm9ivBKFTk6kz1fUjjWKpGo0J6b9ecSkU1bibqkbw
 0BUgqXs0TYKCcI+8ubYKM65FSaRDbM6dGaC7yJ7cy0WO/gOgZc9fLsM0CqjTLqOJ2Afp
 8Aubz1hz4AVsE6btZWZKbwJ3Q1e2USeX9Zyh5qFkw91ZUmL8M+pAdXvCRInoGb0AhX5v UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcpvjp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 09:27:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1759C38;
 Thu,  2 May 2019 07:27:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDFA312F3;
 Thu,  2 May 2019 07:27:14 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 May
 2019 09:27:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 2 May 2019 09:27:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Christophe KERELLO <christophe.kerello@st.com>,
 "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [PATCH 0/3] Add Avenger96 board support
Thread-Index: AQHU/oOsIIudWGHu90G70q0n0DVdnKZXUl2A
Date: Thu, 2 May 2019 07:27:14 +0000
Message-ID: <4dbe0cb4-f73b-f7c2-13fe-462e62a88016@st.com>
References: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <7F98717946AE864E8271F259CA1510A3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_03:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/3] Add Avenger96 board support
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

Hi Manivannan

On 4/29/19 2:03 PM, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds board support for Avenger96, a 96Boards Consumer
> Edition board from Arrow Electronics. This board is based on the
> STM32MP1 MPU and the board support is added under st boards since
> there are no significance changes required to boot u-boot on this
> board other than the dts.
> 
> More information about this board can be found in 96Boards website:
> https://www.96boards.org/product/avenger96/
> 
> PS: I only managed to boot u-boot as SSBL with TF-A as FSBL. U-boot
> SPL way of booting is not working.

What are the symptoms ?

Patrice

> 
> Thanks,
> Mani
> 
> Manivannan Sadhasivam (3):
>   arm: dts: stm32mp157: Add missing pinctrl definitions
>   board: stm32mp1: Add Avenger96 board support
>   arm: mach-stm32mp: Add newline to the MAC error message
> 
>  arch/arm/dts/Makefile                         |   1 +
>  arch/arm/dts/stm32mp157-pinctrl.dtsi          |  63 +++
>  .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 177 +++++++++
>  arch/arm/dts/stm32mp157a-avenger96.dts        | 362 ++++++++++++++++++
>  arch/arm/mach-stm32mp/cpu.c                   |   2 +-
>  board/st/stm32mp1/README                      |  23 ++
>  6 files changed, 627 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
>  create mode 100644 arch/arm/dts/stm32mp157a-avenger96.dts
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
