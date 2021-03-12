Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A62338D10
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:28:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF7ACC57196;
	Fri, 12 Mar 2021 12:28:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E3C8C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:28:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCNBTp021424; Fri, 12 Mar 2021 13:28:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KXpwP7qQSGmenkvt3NeU/j0ApPWY1wU1JUFP5BtE11s=;
 b=c8n2WfPGwx6O9kCs+u6a2uEXCAf59O4SOuwbgyj1lEItBl8eilRodAloQ79EHPwJb/ct
 gcfEwlRsqLlTdS1keDfEGzidoVg57Nw89AlfEcK3UIBmqixZ4LpoHjjXppr0BMDPPk5o
 2iAHJqLaXuotbqcedyzCEDIAm/NJgDX7MplKz3rUEDX4cGXnJdp5Fy7KXpRDJFoA5mLm
 +ZSo2WbTo6H5wgW6FpaKZKprR/09fwmZTyVIiqqJEh925K/435sWJjxIDZFIteB5Uz+9
 463QuwstDnMfvWuMSfRIdltiPo9BTVDd0+tOpID2+BzpwZCEg+Xq47munLSKs8xj1yh2 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037d0rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:28:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B6C310002A;
 Fri, 12 Mar 2021 13:28:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04B6023DCC4;
 Fri, 12 Mar 2021 13:28:05 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:28:04 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
 <20210225133652.3.Ief81f05149ac2a0801badd2baadb49387c0e0fcb@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <41e67708-db1c-dd74-0532-dac164f0b5cd@foss.st.com>
Date: Fri, 12 Mar 2021 13:28:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225133652.3.Ief81f05149ac2a0801badd2baadb49387c0e0fcb@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] stm32mp: stm32prog: reactivate
 console and display serial error
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

Hi

On 2/25/21 1:37 PM, Patrick Delaunay wrote:
> When serial instance is not found in device tree, the console
> should be enabled and the error should be indicated.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index a453f89d02..527b6290de 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -476,11 +476,17 @@ static void setup_boot_mode(void)
>  			break;
>  		/* serial : search associated alias in devicetree */
>  		sprintf(cmd, "serial@%x", serial_addr[instance]);
> -		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev))
> -			break;
> -		if (fdtdec_get_alias_seq(gd->fdt_blob, "serial",
> -					 dev_of_offset(dev), &alias))
> +		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev) ||
> +		    fdtdec_get_alias_seq(gd->fdt_blob, "serial",
> +					 dev_of_offset(dev), &alias)) {
> +			/* restore console on error */
> +			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
> +				gd->flags &= ~(GD_FLG_SILENT |
> +					       GD_FLG_DISABLE_CONSOLE);
> +			printf("serial%d = %s not found in device tree!\n",
> +			       instance, cmd);
>  			break;
> +		}
>  		sprintf(cmd, "%d", alias);
>  		env_set("boot_device", "serial");
>  		env_set("boot_instance", cmd);
> 
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
