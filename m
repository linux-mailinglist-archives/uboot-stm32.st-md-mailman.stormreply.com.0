Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9E162D79
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 18:53:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C93B6C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 17:53:32 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26D21C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 17:53:31 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48MT3t5pn1z1qrLp;
 Tue, 18 Feb 2020 18:53:30 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48MT3t4tQWz1qqkc;
 Tue, 18 Feb 2020 18:53:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EQ3KhVE3xICP; Tue, 18 Feb 2020 18:53:29 +0100 (CET)
X-Auth-Info: 2er0/c+QW1e8ioY81/uw5vAZtTzBegAYbzsWAj20TXQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 18 Feb 2020 18:53:28 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200218083836.6369-1-patrick.delaunay@st.com>
 <20200218083836.6369-6-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <80a5e53c-19d6-4d1b-aa36-aa3d5d9162f3@denx.de>
Date: Tue, 18 Feb 2020 18:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218083836.6369-6-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, Michal Simek <michal.simek@xilinx.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/8] usb: dwc3: change trace level for
 phy errors managed by uclass
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

On 2/18/20 9:38 AM, Patrick Delaunay wrote:
> As the error message is now displayed by generic phy functions,
> the pr_err can be change to pr_debug.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/usb/dwc3/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index c5066529b7..6304036c00 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -867,8 +867,8 @@ int dwc3_setup_phy(struct udevice *dev, struct phy **array, int *num_phys)
>  	for (i = 0; i < count; i++) {
>  		ret = generic_phy_init(&usb_phys[i]);
>  		if (ret) {
> -			pr_err("Can't init USB PHY%d for %s\n",
> -			       i, dev->name);
> +			pr_debug("Can't init USB PHY%d for %s\n",
> +				 i, dev->name);

dev_dbg() , since you have a dev pointer.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
