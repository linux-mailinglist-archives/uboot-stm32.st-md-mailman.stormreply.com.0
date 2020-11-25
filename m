Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4622C3BC7
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:15:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36FB8C5662F;
	Wed, 25 Nov 2020 09:15:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C5EAC424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:15:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9BsaZ023505; Wed, 25 Nov 2020 10:15:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5pKcN26Ych7LlD2tJ9yLwzL6WBc9w6OSdfZTfBEEp6c=;
 b=CETWLxaOjSTOkBoWYYp6rYlGzuWbAuX2MPv+lPrfbvGVIKd2C/66YWTPGw7ug2cfYegY
 BNyy36n6TGMQoE3Wc7kzT9OU3L1djLYQg3Af2x/KNV9pukvLL6423u1G4PcwX6Fg8phf
 a+5HG0lduf2RnwjULFmV+eKlL2pMfsXwWg8s2vACTsRt5dKgxFF1gRrSHi4maNR0/S+Z
 LSoHEpYFs3exeEQtapYkfs1Fx+3xHsxcLdqXd80m8cjSAJWJ1qwe8vZ0VTktLifVFUKs
 guQI62gJBICanFe5x8V5hsrVUL/+E1DDv2H46F6SCcCaNNh26itYvlwDmzMb9adsw4uh MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjf8hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:15:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57A3410002A;
 Wed, 25 Nov 2020 10:15:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B6D4230984;
 Wed, 25 Nov 2020 10:15:35 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:15:34 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:15:34 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 2/4] ARM: dts: stm32: DT sync with kernel v5.10-rc1
 for MCU's boards
Thread-Index: AQHWtAwmopasyb20DU+avCHLA8XB7anYrnVw
Date: Wed, 25 Nov 2020 09:15:34 +0000
Message-ID: <61b9fa6e32f14d59becbfc1eca6cf58b@SFHDAG2NODE3.st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
 <20201106071200.6933-3-patrice.chotard@st.com>
In-Reply-To: <20201106071200.6933-3-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_04:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/4] ARM: dts: stm32: DT sync with
 kernel v5.10-rc1 for MCU's boards
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 6 novembre 2020 08:12
> 
> Device tree alignment with kernel v5.10-rc1.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  arch/arm/dts/stm32429i-eval-u-boot.dtsi  |   2 +-
>  arch/arm/dts/stm32429i-eval.dts          |  21 +++--
>  arch/arm/dts/stm32746g-eval-u-boot.dtsi  |   4 +-
>  arch/arm/dts/stm32746g-eval.dts          |  13 ++-
>  arch/arm/dts/stm32f4-pinctrl.dtsi        | 107 ++++++++++++++++++++---
>  arch/arm/dts/stm32f429-disco-u-boot.dtsi |   2 +-
>  arch/arm/dts/stm32f429-disco.dts         |  99 ++++++++++++++++++++-
>  arch/arm/dts/stm32f429.dtsi              |  30 +++++--
>  arch/arm/dts/stm32f469-disco-u-boot.dtsi |   6 +-
>  arch/arm/dts/stm32f469-disco.dts         |  19 ++--
>  arch/arm/dts/stm32f469.dtsi              |   1 -
>  arch/arm/dts/stm32f7-pinctrl.dtsi        |  22 ++---
>  arch/arm/dts/stm32f7-u-boot.dtsi         |   3 +-
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi |   4 +-
>  arch/arm/dts/stm32f746-disco.dts         |   2 +-
>  arch/arm/dts/stm32f746.dtsi              |  12 ++-
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi |   4 +-
>  arch/arm/dts/stm32f769-disco.dts         |   6 +-
>  arch/arm/dts/stm32h743-pinctrl.dtsi      |  10 +--
>  arch/arm/dts/stm32h743.dtsi              |  37 +++++---
>  arch/arm/dts/stm32h743i-disco.dts        |   2 +-
>  arch/arm/dts/stm32h743i-eval.dts         |   2 +-
>  22 files changed, 308 insertions(+), 100 deletions(-)
> 

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm/master, thanks!

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
