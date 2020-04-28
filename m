Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3C1BBCE0
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 13:56:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242D1C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 11:56:18 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C54BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 11:56:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49BKqN5hd1z1rsXp;
 Tue, 28 Apr 2020 13:56:16 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49BKqN5Fvtz1r5Qk;
 Tue, 28 Apr 2020 13:56:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6zhq44aK3_zw; Tue, 28 Apr 2020 13:56:15 +0200 (CEST)
X-Auth-Info: PdJIx1Nr4wPi3N4gYwBEJGkFy2IezzbymCW57ahdUgc=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 28 Apr 2020 13:56:15 +0200 (CEST)
To: Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de
References: <20200428134918.1.I98f004eb93dff0dad8ebd9447a3cff76bd1ecc91@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <ebc953f8-e052-76d3-4a97-b8f63d87534f@denx.de>
Date: Tue, 28 Apr 2020 13:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200428134918.1.I98f004eb93dff0dad8ebd9447a3cff76bd1ecc91@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH] usb: host: dwc3-sti-glue: Use
 UCLASS_NOP instead of UCLASS_MISC
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

On 4/28/20 1:49 PM, Patrice Chotard wrote:
> dwc3-sti-glue has been broken since MISC uclass has been
> modified to scan DT sub-nodes after bind.
> Fixing it by a using the no-op uclass.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  drivers/usb/host/dwc3-sti-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/dwc3-sti-glue.c b/drivers/usb/host/dwc3-sti-glue.c
> index c99a1985cca5..99d4e29414aa 100644
> --- a/drivers/usb/host/dwc3-sti-glue.c
> +++ b/drivers/usb/host/dwc3-sti-glue.c
> @@ -239,7 +239,7 @@ static const struct udevice_id sti_dwc3_glue_ids[] = {
>  
>  U_BOOT_DRIVER(dwc3_sti_glue) = {
>  	.name = "dwc3_sti_glue",
> -	.id = UCLASS_MISC,
> +	.id = UCLASS_NOP,
>  	.of_match = sti_dwc3_glue_ids,
>  	.ofdata_to_platdata = sti_dwc3_glue_ofdata_to_platdata,
>  	.probe = sti_dwc3_glue_probe,
> 

Applied, thanks.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
