Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D58EF991368
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 02:09:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BD7CC7802B;
	Sat,  5 Oct 2024 00:09:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91968C78028
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2024 00:09:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8895688DB2;
 Sat,  5 Oct 2024 02:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728086977;
 bh=OXIvlpLgZIZoSLge8h04Mu5hEaHCLEnFmlmc/2dv74c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kKpfOHdcQ+wqmKWCL55tGcfWEGw65RaHDZqLEaUq+eaO36B9lMcvqXkGsiyMfeSXt
 3H3gAPM0NIIcOBT0GnRurC8kWb0P76tp0mirdenEs5VV2BKuOpxZKNuqUw/uU37LZU
 k0x6XkqEKo1dT/mCNOOCOzUqy0nzLzTM1DGvt8sykbWoDlOzPH0IS32HkMRPWVmZ2V
 7RnDYLYYnWw8ZDfHqxpsVgAqSvTmihgSTW2C04nBmAlvN+sJIRbMUN41FzO96uwr+M
 N9vWG0Avdu+XfVpkWwUDJUdesdkxmK3EwssNL9kp2H3Xe0e7BAnqXrNhjbTCasGXGt
 LOuXVQeXTSIug==
Message-ID: <d6c5d0bf-0fbf-4312-94be-8f6acc999e7d@denx.de>
Date: Sat, 5 Oct 2024 01:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <20241004215213.252840-1-marex@denx.de>
 <20241004221421.GK4737@bill-the-cat>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241004221421.GK4737@bill-the-cat>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Update MAINTAINERS file globs
 for STM32MP DHSOM
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

On 10/5/24 12:14 AM, Tom Rini wrote:
> On Fri, Oct 04, 2024 at 11:51:46PM +0200, Marek Vasut wrote:
>> Update the MAINTAINERS file glob to cover all of STM32MP DHSOM related files.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   board/dhelectronics/dh_stm32mp1/MAINTAINERS | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/MAINTAINERS b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
>> index 865588f5b8b..d6c33c15aac 100644
>> --- a/board/dhelectronics/dh_stm32mp1/MAINTAINERS
>> +++ b/board/dhelectronics/dh_stm32mp1/MAINTAINERS
>> @@ -2,8 +2,7 @@ DH_STM32MP1_PDK2 BOARD
>>   M:	Marek Vasut <marex@denx.de>
>>   L:	u-boot@dh-electronics.com
>>   S:	Maintained
>> -F:	arch/arm/dts/stm32mp15xx-dhcom*
>> +F:	arch/arm/dts/stm32mp*dhco*
>>   F:	board/dhelectronics/dh_stm32mp1/
>> -F:	configs/stm32mp15_dhcom_basic_defconfig
>> -F:	configs/stm32mp15_dhcor_basic_defconfig
>> +F:	configs/stm32*_dhco*defconfig
>>   F:	include/configs/stm32mp15_dh_dhsom.h
> 
> Do you want to try the "N:	some-regex" syntax to see if that makes
> it less likely to regress in the future? If not, this is fine.
Fixed in V2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
