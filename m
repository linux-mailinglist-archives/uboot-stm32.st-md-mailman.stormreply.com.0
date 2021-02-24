Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5E323F2A
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 15:32:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AE5CC57B58;
	Wed, 24 Feb 2021 14:32:02 +0000 (UTC)
Received: from sibelius.xs4all.nl (sibelius.xs4all.nl [83.163.83.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5DAEC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 14:05:55 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id c6b2d587;
 Wed, 24 Feb 2021 15:05:53 +0100 (CET)
Date: Wed, 24 Feb 2021 15:05:53 +0100 (CET)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20210224124756.12491-1-patrice.chotard@foss.st.com> (message
 from Patrice Chotard on Wed, 24 Feb 2021 13:47:55 +0100)
References: <20210224124756.12491-1-patrice.chotard@foss.st.com>
Message-ID: <c1bc614c7c3e9458@bloch.sibelius.xs4all.nl>
X-Mailman-Approved-At: Wed, 24 Feb 2021 14:32:00 +0000
Cc: sjg@chromium.org, patrice.chotard@st.com, seanga2@gmail.com,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com, etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH] firmware: scmi: Replace
 memcpy_from/toio() by memcpy() in scmi_read/write_resp_from_smt()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> From: Patrice Chotard <patrice.chotard@foss.st.com>
> Date: Wed, 24 Feb 2021 13:47:55 +0100
> 
> To avoid "synchronous abort" in AARCH64 in case the "from" address
> is not aligned, replace memcpy_toio() and memcpy_fromio() by memcpy().
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  drivers/firmware/scmi/smt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This doesnt really make sense.  There is no guarantee that memcpy()
doesn't do an unaligned load or store either.

Unaligned loads and stores from/to normal memory should just work on
arm64, and memcpy_toio() and memcpy_fromio() make sure they don't do
unaligned loads and stores from/to "IO" memory (in this case the
shared memory buffer).

> diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
> index d25478796a..b001163b62 100644
> --- a/drivers/firmware/scmi/smt.c
> +++ b/drivers/firmware/scmi/smt.c
> @@ -93,7 +93,7 @@ int scmi_write_msg_to_smt(struct udevice *dev, struct scmi_smt *smt,
>  			  SMT_HEADER_PROTOCOL_ID(msg->protocol_id) |
>  			  SMT_HEADER_MESSAGE_ID(msg->message_id);
>  
> -	memcpy_toio(hdr->msg_payload, msg->in_msg, msg->in_msg_sz);
> +	memcpy(hdr->msg_payload, msg->in_msg, msg->in_msg_sz);
>  
>  	return 0;
>  }
> @@ -124,7 +124,7 @@ int scmi_read_resp_from_smt(struct udevice *dev, struct scmi_smt *smt,
>  
>  	/* Get the data */
>  	msg->out_msg_sz = hdr->length - sizeof(hdr->msg_header);
> -	memcpy_fromio(msg->out_msg, hdr->msg_payload, msg->out_msg_sz);
> +	memcpy(msg->out_msg, hdr->msg_payload, msg->out_msg_sz);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
