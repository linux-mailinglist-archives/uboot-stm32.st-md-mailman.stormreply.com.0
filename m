Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE91F5B61
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:42:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E0EDC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 18:42:26 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DF19C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 18:42:24 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49hwp71yWkz1rvxj;
 Wed, 10 Jun 2020 20:42:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49hwp71M3kz1qqkk;
 Wed, 10 Jun 2020 20:42:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id WE9FOFPny-Qx; Wed, 10 Jun 2020 20:42:21 +0200 (CEST)
X-Auth-Info: LiyMe44B80NBLXW3qx2ZNscfVDhOsEGGkEOWtnS5xC8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 10 Jun 2020 20:42:21 +0200 (CEST)
To: Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
 <20200610181019.GE24893@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
Date: Wed, 10 Jun 2020 20:42:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610181019.GE24893@bill-the-cat>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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

On 6/10/20 8:10 PM, Tom Rini wrote:
> On Mon, Jun 08, 2020 at 11:27:19AM +0200, Patrick Delaunay wrote:
> 
>> Add configuration flag to select the supported dwc driver configuration:
>> - CONFIG_DWC_ETH_QOS_TEGRA186
>> - CONFIG_DWC_ETH_QOS_IMX
>> - CONFIG_DWC_ETH_QOS_STM32
>>
>> See Linux driver ethernet/stmicro/stmmac and associated glue layers
>> for other configuration examples.
>>
>> This patch removes the not-selected compatibles and lets the linker remove
>> the unused functions to reduce the size of the driver.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>> Hi,
>>
>> I propose this patch after Marek's remark in [1].
>>
>> It is also linked to [2] to limit the STM32 glue for ST compatible.
>>
>> [1] net: dwc_eth_qos: Make clk_rx and clk_tx optional
>>     http://patchwork.ozlabs.org/project/uboot/patch/20200512095603.29126-5-david.wu@rock-chips.com/#2432595
>>
>> [2] net: dwc_eth_qos: update the compatible supported for STM32
>>     http://patchwork.ozlabs.org/project/uboot/list/?series=176917
>>
>>
>>  drivers/net/Kconfig       | 27 ++++++++++++++++++++++++---
>>  drivers/net/dwc_eth_qos.c | 12 +++++++++---
>>  2 files changed, 33 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
>> index 0b08de0ef4..c4b3667d3b 100644
>> --- a/drivers/net/Kconfig
>> +++ b/drivers/net/Kconfig
>> @@ -156,9 +156,30 @@ config DWC_ETH_QOS
>>  	help
>>  	  This driver supports the Synopsys Designware Ethernet QOS (Quality
>>  	  Of Service) IP block. The IP supports many options for bus type,
>> -	  clocking/reset structure, and feature list. This driver currently
>> -	  supports the specific configuration used in NVIDIA's Tegra186 chip,
>> -	  but should be extensible to other combinations quite easily.
>> +	  clocking/reset structure, and feature list.
>> +
>> +config DWC_ETH_QOS_IMX
>> +	bool "Synopsys DWC Ethernet QOS device support for IMX"
>> +	depends on DWC_ETH_QOS
>> +	help
>> +	  The Synopsys Designware Ethernet QOS IP block with the specific
>> +	  configuration used in IMX soc.
>> +
>> +config DWC_ETH_QOS_STM32
>> +	bool "Synopsys DWC Ethernet QOS device support for STM32"
>> +	depends on DWC_ETH_QOS
>> +	default y if ARCH_STM32MP
>> +	help
>> +	  The Synopsys Designware Ethernet QOS IP block with the specific
>> +	  configuration used in STM32MP soc.
>> +
>> +config DWC_ETH_QOS_TEGRA186
>> +	bool "Synopsys DWC Ethernet QOS device support for TEGRA186"
>> +	depends on DWC_ETH_QOS
>> +	default y if TEGRA186
>> +	help
>> +	  The Synopsys Designware Ethernet QOS IP block with specific
>> +	  configuration used in NVIDIA's Tegra186 chip.
>>  
>>  config E1000
>>  	bool "Intel PRO/1000 Gigabit Ethernet support"
> 
> I like this idea.  But, is there a reason to have more than one of these
> enabled?  Assuming not, we should do this as a choice I think so it'll
> be clear to the next SoC that they'll need to add this table right away.

Should we be able to enable different settings in U-Boot and in SPL ,
e.g. for the use case where the SPL is the same on different SoCs, while
the U-Boot binary is not ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
