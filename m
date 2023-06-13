Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44A72D9D5
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:24:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D0DEC6A615;
	Tue, 13 Jun 2023 06:24:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9878DC6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:24:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6G88c014664; Tue, 13 Jun 2023 08:24:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q4+3AaJSSXWTyTxChnIC3kXynzDn66J/70RaYy4hqzE=;
 b=vocdQlJzvEVIo3pzZX2HNIpQPnWsabbOVl0B5UZgUlkC7zuJHnKVnqw465z4/S5Cnhmd
 Y093zlKC8/SNfqPexeQCzoX23G0jnJzwYZ9oaTTdwvNuCQPlrB1fpG5vdqU/8xka26pz
 HtMltmqzupqdynzI2UnW/NLert86Hbh+YiEuLzBOTt28sYJ6J5LzDcuEjatTy7JHAgmm
 Hj7jceWNzsBhjyUu+DnlRPIgGw2yToK0jJt4BfSZne8/E3aCXyr9pXm0GHdSPBcVou33
 r0vfVEJBO0mCqUlaBHkSAqCxWizBGxF94IfHwt1Bdu85I1/8+2IF/Q7D/hMAS0rJziPV qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6k1sg1cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:24:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7732C10002A;
 Tue, 13 Jun 2023 08:24:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7005A2128D3;
 Tue, 13 Jun 2023 08:24:07 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:24:07 +0200
Message-ID: <925af9fb-90ef-e428-b728-744d83f9de56@foss.st.com>
Date: Tue, 13 Jun 2023 08:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.10.I244f84db09e1225f509e2b1072e974810f2024df@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.10.I244f84db09e1225f509e2b1072e974810f2024df@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 10/12] stm32mp: stm32prog: Remove
 tee_detected from stm32prog_data struct
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> As stm32prog_get_tee_partitions() is no more used, remove tee_detected
> boolean from stm32prog_data struct and all code using it.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c |  9 ---------
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 11 -----------
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     |  3 ---
>  arch/arm/mach-stm32mp/include/mach/stm32prog.h      |  4 ----
>  4 files changed, 27 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index cfafa539aeb9..c695cc11232b 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -180,15 +180,6 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
>  	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
>  );
>  
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> -bool stm32prog_get_tee_partitions(void)
> -{
> -	if (stm32prog_data)
> -		return stm32prog_data->tee_detected;
> -
> -	return false;
> -}
> -#endif
>  
>  bool stm32prog_get_fsbl_nor(void)
>  {
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 241ad40abb7c..0cdc14dd5bc8 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -995,9 +995,6 @@ static int treat_partition_list(struct stm32prog_data *data)
>  		INIT_LIST_HEAD(&data->dev[j].part_list);
>  	}
>  
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> -	data->tee_detected = false;
> -#endif
>  	data->fsbl_nor_detected = false;
>  	for (i = 0; i < data->part_nb; i++) {
>  		part = &data->part_array[i];
> @@ -1049,14 +1046,6 @@ static int treat_partition_list(struct stm32prog_data *data)
>  			    !strncmp(part->name, "fsbl", 4))
>  				data->fsbl_nor_detected = true;
>  			/* fallthrough */
> -		case STM32PROG_NAND:
> -		case STM32PROG_SPI_NAND:
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> -			if (!data->tee_detected &&
> -			    !strncmp(part->name, "tee", 3))
> -				data->tee_detected = true;
> -			break;
> -#endif
>  		default:
>  			break;
>  		}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 58f4b96fa752..04a899ee1184 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -149,9 +149,6 @@ struct stm32prog_data {
>  	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
>  	int			part_nb;	/* nb of partition */
>  	struct stm32prog_part_t	*part_array;	/* array of partition */
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> -	bool			tee_detected;
> -#endif
>  	bool			fsbl_nor_detected;
>  
>  	/* command internal information */
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> index 99be4e1d656b..23d1adfbad92 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> @@ -11,8 +11,4 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
>  			       void *buf, long *len);
>  int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
>  
> -#ifdef CONFIG_STM32MP15x_STM32IMAGE
> -bool stm32prog_get_tee_partitions(void);
> -#endif
> -
>  bool stm32prog_get_fsbl_nor(void);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
