Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C783754F35A
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 10:47:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D1A4C5F1F2;
	Fri, 17 Jun 2022 08:47:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1480BC5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 08:47:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6xsJM005207;
 Fri, 17 Jun 2022 10:47:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G4B7kemrwja+4V+azq08wwFEwvdp2n2dlYgL5fS0Lag=;
 b=ygBGdwyUrzum09bVjoRxuGWLqMBekNjy75VtTTG1z/g2nKNOXHlrRkswzARV71rKfJd4
 L/Y5EeSbEZRjGmfCzvij9JyNX/caU8wFtNKZuiyDeR235Ib7bqsNQ3DR/CsXylhI1fI1
 gAQfPrIHHy1PqLo5BEgsvkPUFb8/UbMz5FFytDXu9mGXZNk8rZ3cKC0M4UOPML7ZNjCs
 pfhBx7ccAL5VuMsLm85LJratF3LaGOLLbRZssk+mqBuGsEMjNK9XWaLDrmNneDxVinD5
 uPp3psa1dYtVQZ7a+1Ko7Tv/oD9UQc+/JYIhfpNj1W/6x012cF6bFawHcDE+YKKyddHr xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmu98msq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 10:47:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B51A6100034;
 Fri, 17 Jun 2022 10:47:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A92AA2194F1;
 Fri, 17 Jun 2022 10:47:05 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 10:47:05 +0200
Message-ID: <ac513e11-9907-b8d8-f98f-97633ef84588@foss.st.com>
Date: Fri, 17 Jun 2022 10:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.1.Ie3d027b1bf2a425d996e07a09ea8e5042ea26449@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220506160540.1.Ie3d027b1bf2a425d996e07a09ea8e5042ea26449@changeid>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 01/16] ARM: dts: stm32: add STM32MP13 SoCs
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add initial support of STM32MP13 family based on v5.18-rc2
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp13-pinctrl.dtsi | 123 ++++++++++
>   arch/arm/dts/stm32mp131.dtsi        | 358 ++++++++++++++++++++++++++++
>   arch/arm/dts/stm32mp133.dtsi        |  37 +++
>   arch/arm/dts/stm32mp135.dtsi        |  12 +
>   arch/arm/dts/stm32mp135f-dk.dts     |  57 +++++
>   arch/arm/dts/stm32mp13xc.dtsi       |  17 ++
>   arch/arm/dts/stm32mp13xf.dtsi       |  17 ++
>   board/st/stm32mp1/MAINTAINERS       |   1 +
>   8 files changed, 622 insertions(+)
>   create mode 100644 arch/arm/dts/stm32mp13-pinctrl.dtsi
>   create mode 100644 arch/arm/dts/stm32mp131.dtsi
>   create mode 100644 arch/arm/dts/stm32mp133.dtsi
>   create mode 100644 arch/arm/dts/stm32mp135.dtsi
>   create mode 100644 arch/arm/dts/stm32mp135f-dk.dts
>   create mode 100644 arch/arm/dts/stm32mp13xc.dtsi
>   create mode 100644 arch/arm/dts/stm32mp13xf.dtsi
>

Applied to u-boot-stm/next, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
