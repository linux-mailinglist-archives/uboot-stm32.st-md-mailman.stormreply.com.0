Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30F5FC961
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 18:41:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F515C640F3;
	Wed, 12 Oct 2022 16:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D0A1C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 16:41:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CFlRjG013940;
 Wed, 12 Oct 2022 18:41:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/Akb9Ylu84FTTVAGskq2ISno3GAhBe5Zz7dEx8uyxA4=;
 b=mUin/f1rjsNoLx6FZcOBfN1AjimpeYubiC/IMkvmkEvQYaSiIanY+aHW06DWcFgbWkHp
 vvpgBg0Rnda4G4Ha8La3an18qG1lY34217QcbUjtzs0UFOdz9OXMJXubM2wl5ODrwQet
 uPQIltlSU1KBOme5QSbuI+0/TlRNGuItKotOWSxTFnrfBxkCTXWz9CpMoxuQSdffuWdx
 NerO5Yc+Heu+zTG3zZ7jGmXjyCtXOkeHYcZ4mHJbv/nmAnzBXmnKn8A7xQKHFZTv1h17
 brLJL//9P0BnIK0as5UxYLLd3krBdVtsWpDzhmOZGBvokEST/YCx/QkAW2qxYRwZ6US2 sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31gq4ep6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 18:41:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59254100034;
 Wed, 12 Oct 2022 18:40:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F606236955;
 Wed, 12 Oct 2022 18:40:58 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 18:40:55 +0200
Message-ID: <55986908-fa0d-24de-585a-f6867b86477f@foss.st.com>
Date: Wed, 12 Oct 2022 18:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
 <20221012123317.434898-4-gabriel.fernandez@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221012123317.434898-4-gabriel.fernandez@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] arm: dts: stm32mp13: add support of
	RCC driver
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

On 10/12/22 14:33, Gabriel Fernandez wrote:
> Adds support of Clock and Reset drivers for STM32MP13 platform.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>
> ---
>
>   arch/arm/dts/stm32mp13-u-boot.dtsi |   4 +
>   arch/arm/dts/stm32mp131.dtsi       | 119 +++++++++++------------------
>   arch/arm/dts/stm32mp133.dtsi       |   4 +-
>   arch/arm/dts/stm32mp13xf.dtsi      |   3 +-
>   4 files changed, 52 insertions(+), 78 deletions(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
