Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A80131387F5
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 20:51:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E501C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 19:51:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BC37C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 19:51:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47wnQb05mQz1rdjd;
 Sun, 12 Jan 2020 20:51:03 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47wnQZ6mtlz1qqkS;
 Sun, 12 Jan 2020 20:51:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id COiY--7-Q_uT; Sun, 12 Jan 2020 20:51:02 +0100 (CET)
X-Auth-Info: f7fFs/jbaXtAo/iRiDo7yZvrpTHaH1QppXFli1o5UP8=
Received: from crub (p508B64CC.dip0.t-ipconnect.de [80.139.100.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 12 Jan 2020 20:51:02 +0100 (CET)
Date: Sun, 12 Jan 2020 20:51:01 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200112205101.669fe9d3@crub>
In-Reply-To: <20200110085027.1.I4a80e4d2935f07164868f198fe868a0999be777e@changeid>
References: <20200110085027.1.I4a80e4d2935f07164868f198fe868a0999be777e@changeid>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] tools: ftdgrep: correct the find regions
 loop in do_fdtgrep
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

Hi Patrick,

On Fri, 10 Jan 2020 08:50:31 +0100
Patrick Delaunay patrick.delaunay@st.com wrote:
...
> diff --git a/tools/fdtgrep.c b/tools/fdtgrep.c
> index 8f44f599c1..bcf06b871d 100644
> --- a/tools/fdtgrep.c
> +++ b/tools/fdtgrep.c
> @@ -823,8 +823,10 @@ static int do_fdtgrep(struct display_info *disp, const char *filename)
>  		}
>  		if (count <= max_regions)
>  			break;
> +	}
> +	if (count > max_regions) {
>  		free(region);

This change moved free(region) out of the loop. If you do so, then
please also change malloc() in the loop to realloc():

	region = realloc(region, count * sizeof(struct fdt_region));

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
