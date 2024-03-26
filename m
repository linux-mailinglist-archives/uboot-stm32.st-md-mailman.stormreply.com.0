Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEF288CA47
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Mar 2024 18:08:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77117C6B46B;
	Tue, 26 Mar 2024 17:08:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1B54C640E5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 17:08:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1AD3F87ABC;
 Tue, 26 Mar 2024 18:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1711472892;
 bh=NVyAysE4Sc7z3be5CpVuhMk8f/YvLzUYeFx+F3v65lw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ThS7MwijlxNSBzUYRJIAfK2EdZ5qkkJqQdMEHEqKhY/unPoewaiwCLUyShrtQEwJ1
 39WQEEd4QRDiygn8Ape2dwMdp3HdPFXczSkIZ0y0YNB7AYCS+C1OF5ikb3RrbxbOv1
 bQ79a51B0EJ1UQmebggeCS45yxOLuhcRsryDv0qQ/7vc+BI5E/VP3KdPwc9m6e/I5z
 2kE1dOAjoC/W2oghbVvJdoPeQBuEg/k9sVpT4tJMqCXRjG2BkcGYVr7TcMgxpq2jU7
 IMQwnijfMVt2FYY9yyIldMd1Y/i6HsU+md5wDHNELvODMYyu6xd35Y6/bEQlnQmzVr
 VA1kXkxaUwBxg==
Message-ID: <7ed56763-f494-4d19-82a0-05f0cc557241@denx.de>
Date: Tue, 26 Mar 2024 18:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20240319024430.103196-1-marex@denx.de>
 <f2ab30e8-e65a-4025-a203-639d7ff1b01e@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f2ab30e8-e65a-4025-a203-639d7ff1b01e@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Default dfu_alt_info for
	STM32MP13xx SPI NOR
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

On 3/19/24 11:22 AM, Patrice CHOTARD wrote:
> 
> 
> On 3/19/24 03:44, Marek Vasut wrote:
>> Define dfu_alt_info with SPI NOR layout to make it easy to
>> install or update bootloader in the SPI NOR using dfu-util.
>>
>> Use the following U-Boot commands to start DFU mode:
>> "
>> => sf probe && dfu 0 mtd
>> "
>>
>> Use the following dfu-util invocation on Host PC to install binaries:
>> "
>> $ dfu-util -w -a 0 -D build/stm32mp1/release/tf-a-stm32mp135f-dhcor-dhsbc.stm32
>> $ dfu-util -w -a 1 -D build/stm32mp1/release/tf-a-stm32mp135f-dhcor-dhsbc.stm32
>> $ dfu-util -w -a 2 -D build/stm32mp1/release/fip.bin
>> "
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   include/configs/stm32mp13_common.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
>> index 5b0658ced92..d6e4f8fd915 100644
>> --- a/include/configs/stm32mp13_common.h
>> +++ b/include/configs/stm32mp13_common.h
>> @@ -63,6 +63,7 @@
>>   	"fi;\0"
>>   
>>   #define STM32MP_EXTRA \
>> +	"dfu_alt_info=mtd nor0=fsbl1 raw 0x0 0x40000;fsbl2 raw 0x40000 0x40000;uboot raw 0x80000 0x160000\0" \
>>   	"env_check=if env info -p -d -q; then env save; fi\0" \
>>   	"boot_net_usb_start=true\0"
>>   
> 
> 
> Hi Marek
> 
> On our STM32 board, the dfu_alt_info is build dynamically, we have CONFIG_SET_DFU_ALT_INFO enable
> Can you add the dfu_alt_info in a specific stm32mp13_dhxx.common.h instead ?

You can drop this patch.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
