Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E38383ED330
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Aug 2021 13:39:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC690C57B60;
	Mon, 16 Aug 2021 11:39:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C26DC57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 11:39:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GBVg7j021296; Mon, 16 Aug 2021 13:39:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0dBQLxjFkuz0dJNI9GAUcV1uzgJDBeX8zGIfcROAzHg=;
 b=q2GE8p2pNDVzg2VVCyuTNNG7mmJGlZfLa9W1hLxZPGwwCwNiy8U2zz0YliyKvfDjh0j7
 sWVGZL8Z25aTHypkjYCdsUaZErmPJRUe/EVacWtIG6qcHw4IKGXQPIm3L9xplPsOw7bJ
 mfgzBPPbtA+xD268kser2VrRVvtn+NutihkZ4PofG+KTYe19PGzt0xHd/KL3T0nfatXu
 oC12l46FrbRnoeCUmWRRw04C08QNXvs+kEPYicL0KJ14bXx1PeNxvLlyPWp8FwG929CL
 MVMnUpKYsgqaVP249cJ9pbZkV0YY+oyzjkrPE/wKp8r1F7bUAX+x/nUSmNDf55E6cS1t yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3af28xmknk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 13:39:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2D4010002A;
 Mon, 16 Aug 2021 13:39:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E96E52309EF;
 Mon, 16 Aug 2021 13:39:21 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 13:39:21 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
 <20210726111931.v3.5.I1aeda5b6cc2115de802f79656884387d7a7ca94c@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <38163272-e088-4dbe-99d9-70696511c32a@foss.st.com>
Date: Mon, 16 Aug 2021 13:39:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726111931.v3.5.I1aeda5b6cc2115de802f79656884387d7a7ca94c@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_04:2021-08-16,
 2021-08-16 signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v3 5/5] stm32mp1: stm32prog: remove
 stm32prog_get_tee_partitions with FIP
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

Hi Patrick

On 7/26/21 11:21 AM, Patrick Delaunay wrote:
> The MTD tee partitions used to save the OP-TEE binary are needed when
> TF-A doesn't use the FIP container to load binaries.
> 
> This patch puts under CONFIG_STM32MP15x_STM32IMAGE flag the associated
> code in U-Boot binary and prepare the code cleanup when
> CONFIG_STM32MP15x_STM32IMAGE support will be removed after TF-A migration
> to FIP support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 2 ++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 4 ++++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     | 2 ++
>  arch/arm/mach-stm32mp/include/mach/stm32prog.h      | 2 ++
>  4 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 064f51b2c7..1bccad4e6d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -185,6 +185,7 @@ U_BOOT_CMD(stm32prog, 5, 0, do_stm32prog,
>  	   "  <size> = size of flashlayout (optional for image with STM32 header)\n"
>  );
>  
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  bool stm32prog_get_tee_partitions(void)
>  {
>  	if (stm32prog_data)
> @@ -192,6 +193,7 @@ bool stm32prog_get_tee_partitions(void)
>  
>  	return false;
>  }
> +#endif
>  
>  bool stm32prog_get_fsbl_nor(void)
>  {
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 96ebc6d978..0971ee79af 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -824,7 +824,9 @@ static int treat_partition_list(struct stm32prog_data *data)
>  		INIT_LIST_HEAD(&data->dev[j].part_list);
>  	}
>  
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  	data->tee_detected = false;
> +#endif
>  	data->fsbl_nor_detected = false;
>  	for (i = 0; i < data->part_nb; i++) {
>  		part = &data->part_array[i];
> @@ -878,10 +880,12 @@ static int treat_partition_list(struct stm32prog_data *data)
>  			/* fallthrough */
>  		case STM32PROG_NAND:
>  		case STM32PROG_SPI_NAND:
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  			if (!data->tee_detected &&
>  			    !strncmp(part->name, "tee", 3))
>  				data->tee_detected = true;
>  			break;
> +#endif
>  		default:
>  			break;
>  		}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index 9d58cf0e2d..240c5c44bc 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -122,7 +122,9 @@ struct stm32prog_data {
>  	struct stm32prog_dev_t	dev[STM32PROG_MAX_DEV];	/* array of device */
>  	int			part_nb;	/* nb of partition */
>  	struct stm32prog_part_t	*part_array;	/* array of partition */
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  	bool			tee_detected;
> +#endif
>  	bool			fsbl_nor_detected;
>  
>  	/* command internal information */
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32prog.h b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> index c080b9cc42..99be4e1d65 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32prog.h
> @@ -11,6 +11,8 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
>  			       void *buf, long *len);
>  int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size);
>  
> +#ifdef CONFIG_STM32MP15x_STM32IMAGE
>  bool stm32prog_get_tee_partitions(void);
> +#endif
>  
>  bool stm32prog_get_fsbl_nor(void);
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
