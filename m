Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F512EBFA9
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jan 2021 15:38:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA54DC56634;
	Wed,  6 Jan 2021 14:38:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 063EDC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 14:38:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106EbwZk024551; Wed, 6 Jan 2021 15:38:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ej76X6S6DFhgq6vwQb+7LaV55xFargrrn+3Ikjhg+A0=;
 b=K9DRrk72KI6xFSkKJi4YvQCRT+yhuuk1Ghm931J8JWsfR/S4S/1PDptkDLhw07MU0dM5
 MgknrzkK8w6L7Ez6AuvtuYS9n+wwPADDNi3jKyPH8TJ13CjNSMHb4EV6fv8vGHtImENi
 nMU+sqaeD5zM2B5fL906veRHr3DNwPFYP4aFjDYv/V4oxXmYkPtHeQswu84AgEabHRX1
 WWpN/vW8nkD55b1P59hMQwyAUyYksx6m01HEZNGEMmqS8Ex5jmHCQwxZMvOAkqTdOVju
 Fj5x1U+24yueWDVysnvX8kjYjKJ7NdHsMXMv6EzWfQ90Mhi/A57ZdjeiMzRz6X5MROxn OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuv84ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 15:38:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BAC510002A;
 Wed,  6 Jan 2021 15:38:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EB9D2C38D1;
 Wed,  6 Jan 2021 15:38:00 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan
 2021 15:37:59 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <9fe786f1-3b88-e93e-983d-388a7b181f4c@foss.st.com>
Date: Wed, 6 Jan 2021 15:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211133612.1.I5168c97ed041354102af2ba6ba3f5b3e5d0b9a47@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_06:2021-01-06,
 2021-01-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: always flush DFU
 on start command for uart
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

On 12/11/20 1:36 PM, Patrick Delaunay wrote:
> From: Patrick Delaunay <patrick.delaunay@st.com>
>
> Remove the test on data->dfu_seq, because dfu_seq=0 not only when
> the DFU is not started (mask with 0xffff). This flush is mandatory
> as the final treatment, common with USB, is done in DFU callback.
>
> This patch avoids issue if the received length is a multiple of
> the DFU packet.
>
> For example if size of bootfs partition is egual to 0x4000000,
> data->dfu_seq=0 at the end of the partition, the flush it not
> requested and the phase is not increased in the callback.
> U-Boot continue to request the bootfs in the next GetPhase command.
>
> Fixes: 468f0508b58b ("stm32mp: stm32prog: add serial link support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  .../mach-stm32mp/cmd_stm32prog/stm32prog_serial.c   | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> index 8aad4be467..8fba92b2b5 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -397,14 +397,13 @@ static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
>  		if (!dfu_entity)
>  			return -ENODEV;
>  
> -		if (data->dfu_seq) {
> -			ret = dfu_flush(dfu_entity, NULL, 0, data->dfu_seq);
> -			data->dfu_seq = 0;
> -			if (ret) {
> -				stm32prog_err("DFU flush failed [%d]", ret);
> -				return ret;
> -			}
> +		ret = dfu_flush(dfu_entity, NULL, 0, data->dfu_seq);
> +		if (ret) {
> +			stm32prog_err("DFU flush failed [%d]", ret);
> +			return ret;
>  		}
> +		data->dfu_seq = 0;
> +
>  		printf("\n  received length = 0x%x\n", data->cursor);
>  		if (data->header.present) {
>  			if (data->cursor !=

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
