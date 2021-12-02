Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE0466103
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Dec 2021 10:58:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3F0BC5F1D4;
	Thu,  2 Dec 2021 09:58:50 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D464C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 05:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 72974CD1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 06:44:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrKWFJHqmSco
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 06:44:45 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 15D9C324A; Thu,  2 Dec 2021 06:44:44 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
 *      blocked.  See
 *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 *      for more information. *      [URIs: thorsis.com]
 * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
 * -0.0 NO_RECEIVED Informational: message has no Received headers
Date: Thu, 2 Dec 2021 06:44:27 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Sean Anderson <seanga2@gmail.com>
Message-ID: <YahdO6CUgevLGSg+@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Sean Anderson <seanga2@gmail.com>,
 Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 Lokesh Vutla <lokeshvutla@ti.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Dave Gerlach <d-gerlach@ti.com>,
 Hai Pham <hai.pham.ud@renesas.com>,
 Dario Binacchi <dariobin@libero.it>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marex@denx.de>
References: <20211201192653.2171260-1-seanga2@gmail.com>
Content-Disposition: inline
In-Reply-To: <20211201192653.2171260-1-seanga2@gmail.com>
X-Mailman-Approved-At: Thu, 02 Dec 2021 09:58:50 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Hai Pham <hai.pham.ud@renesas.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 u-boot@lists.denx.de, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Dave Gerlach <d-gerlach@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Uboot-stm32] [PATCH] treewide: invaild -> invalid
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

Moin,

Am Wed, Dec 01, 2021 at 02:26:53PM -0500 schrieb Sean Anderson:
> Somewhere along the way, someone misspelt "invalid" and it got copied
> everywhere. Fix it.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
> 
>  drivers/clk/clk-uclass.c               | 2 +-
>  drivers/clk/clk_stm32f.c               | 2 +-
>  drivers/clk/clk_stm32h7.c              | 2 +-
>  drivers/clk/clk_versaclock.c           | 2 +-
>  drivers/clk/renesas/clk-rcar-gen2.c    | 2 +-
>  drivers/clk/renesas/clk-rcar-gen3.c    | 2 +-
>  drivers/clk/ti/clk-ctrl.c              | 2 +-
>  drivers/dma/dma-uclass.c               | 2 +-
>  drivers/hwspinlock/hwspinlock-uclass.c | 2 +-
>  drivers/mailbox/k3-sec-proxy.c         | 2 +-
>  drivers/mailbox/mailbox-uclass.c       | 2 +-
>  drivers/mailbox/tegra-hsp.c            | 2 +-
>  drivers/misc/irq-uclass.c              | 2 +-
>  drivers/mux/mux-uclass.c               | 2 +-
>  drivers/phy/phy-uclass.c               | 2 +-
>  drivers/reset/reset-uclass.c           | 2 +-
>  16 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
> index 493018b33e..e5defd7ca8 100644
> --- a/drivers/clk/clk-uclass.c
> +++ b/drivers/clk/clk-uclass.c
> @@ -57,7 +57,7 @@ static int clk_of_xlate_default(struct clk *clk,
>  	debug("%s(clk=%p)\n", __func__, clk);
>  
>  	if (args->args_count > 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/clk_stm32f.c
> index e7c26db51c..ed7660196e 100644
> --- a/drivers/clk/clk_stm32f.c
> +++ b/drivers/clk/clk_stm32f.c
> @@ -703,7 +703,7 @@ static int stm32_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
>  	dev_dbg(clk->dev, "clk=%p\n", clk);
>  
>  	if (args->args_count != 2) {
> -		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
> +		dev_dbg(clk->dev, "Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/clk_stm32h7.c
> index 20b3647099..d440c28eb4 100644
> --- a/drivers/clk/clk_stm32h7.c
> +++ b/drivers/clk/clk_stm32h7.c
> @@ -835,7 +835,7 @@ static int stm32_clk_of_xlate(struct clk *clk,
>  			struct ofnode_phandle_args *args)
>  {
>  	if (args->args_count != 1) {
> -		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
> +		dev_dbg(clk->dev, "Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/clk/clk_versaclock.c b/drivers/clk/clk_versaclock.c
> index 578668bcf8..89c8d02336 100644
> --- a/drivers/clk/clk_versaclock.c
> +++ b/drivers/clk/clk_versaclock.c
> @@ -627,7 +627,7 @@ static int vc5_clk_out_xlate(struct clk *hw, struct ofnode_phandle_args *args)
>  	unsigned int idx = args->args[0];
>  
>  	if (args->args_count != 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
> index d2d0169dd8..3a68c5ad0e 100644
> --- a/drivers/clk/renesas/clk-rcar-gen2.c
> +++ b/drivers/clk/renesas/clk-rcar-gen2.c
> @@ -256,7 +256,7 @@ static ulong gen2_clk_set_rate(struct clk *clk, ulong rate)
>  static int gen2_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
>  {
>  	if (args->args_count != 2) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/clk/renesas/clk-rcar-gen3.c b/drivers/clk/renesas/clk-rcar-gen3.c
> index 6cf07fb418..bcf5865222 100644
> --- a/drivers/clk/renesas/clk-rcar-gen3.c
> +++ b/drivers/clk/renesas/clk-rcar-gen3.c
> @@ -365,7 +365,7 @@ static ulong gen3_clk_set_rate(struct clk *clk, ulong rate)
>  static int gen3_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
>  {
>  	if (args->args_count != 2) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/clk/ti/clk-ctrl.c b/drivers/clk/ti/clk-ctrl.c
> index 8ac085ee4f..6cc02d2eea 100644
> --- a/drivers/clk/ti/clk-ctrl.c
> +++ b/drivers/clk/ti/clk-ctrl.c
> @@ -83,7 +83,7 @@ static int clk_ti_ctrl_of_xlate(struct clk *clk,
>  				struct ofnode_phandle_args *args)
>  {
>  	if (args->args_count != 2) {
> -		dev_err(clk->dev, "invaild args_count: %d\n", args->args_count);
> +		dev_err(clk->dev, "invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/dma/dma-uclass.c b/drivers/dma/dma-uclass.c
> index 652ddbb62b..012609bb53 100644
> --- a/drivers/dma/dma-uclass.c
> +++ b/drivers/dma/dma-uclass.c
> @@ -35,7 +35,7 @@ static int dma_of_xlate_default(struct dma *dma,
>  	debug("%s(dma=%p)\n", __func__, dma);
>  
>  	if (args->args_count > 1) {
> -		pr_err("Invaild args_count: %d\n", args->args_count);
> +		pr_err("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/hwspinlock/hwspinlock-uclass.c b/drivers/hwspinlock/hwspinlock-uclass.c
> index cbe7236011..e012d5a4c9 100644
> --- a/drivers/hwspinlock/hwspinlock-uclass.c
> +++ b/drivers/hwspinlock/hwspinlock-uclass.c
> @@ -25,7 +25,7 @@ static int hwspinlock_of_xlate_default(struct hwspinlock *hws,
>  				       struct ofnode_phandle_args *args)
>  {
>  	if (args->args_count > 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/mailbox/k3-sec-proxy.c b/drivers/mailbox/k3-sec-proxy.c
> index 20fdb09f31..a862e55bc3 100644
> --- a/drivers/mailbox/k3-sec-proxy.c
> +++ b/drivers/mailbox/k3-sec-proxy.c
> @@ -116,7 +116,7 @@ static int k3_sec_proxy_of_xlate(struct mbox_chan *chan,
>  	debug("%s(chan=%p)\n", __func__, chan);
>  
>  	if (args->args_count != 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  	ind = args->args[0];
> diff --git a/drivers/mailbox/mailbox-uclass.c b/drivers/mailbox/mailbox-uclass.c
> index 01c9e75fa5..85ba8c5fd9 100644
> --- a/drivers/mailbox/mailbox-uclass.c
> +++ b/drivers/mailbox/mailbox-uclass.c
> @@ -24,7 +24,7 @@ static int mbox_of_xlate_default(struct mbox_chan *chan,
>  	debug("%s(chan=%p)\n", __func__, chan);
>  
>  	if (args->args_count != 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 1d66d95fe4..08c51c40f1 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -77,7 +77,7 @@ static int tegra_hsp_of_xlate(struct mbox_chan *chan,
>  	debug("%s(chan=%p)\n", __func__, chan);
>  
>  	if (args->args_count != 2) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/misc/irq-uclass.c b/drivers/misc/irq-uclass.c
> index eb9f3b902f..7b79ed2df4 100644
> --- a/drivers/misc/irq-uclass.c
> +++ b/drivers/misc/irq-uclass.c
> @@ -89,7 +89,7 @@ static int irq_of_xlate_default(struct irq *irq,
>  	log_debug("(irq=%p)\n", irq);
>  
>  	if (args->args_count > 1) {
> -		log_debug("Invaild args_count: %d\n", args->args_count);
> +		log_debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/mux/mux-uclass.c b/drivers/mux/mux-uclass.c
> index 91842c5539..8870305313 100644
> --- a/drivers/mux/mux-uclass.c
> +++ b/drivers/mux/mux-uclass.c
> @@ -130,7 +130,7 @@ static int mux_of_xlate_default(struct mux_chip *mux_chip,
>  	log_debug("%s(muxp=%p)\n", __func__, muxp);
>  
>  	if (args->args_count > 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
> index 59683a080c..706e9fdf3a 100644
> --- a/drivers/phy/phy-uclass.c
> +++ b/drivers/phy/phy-uclass.c
> @@ -23,7 +23,7 @@ static int generic_phy_xlate_offs_flags(struct phy *phy,
>  	debug("%s(phy=%p)\n", __func__, phy);
>  
>  	if (args->args_count > 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
> index c09c009130..ca9f00a8f2 100644
> --- a/drivers/reset/reset-uclass.c
> +++ b/drivers/reset/reset-uclass.c
> @@ -26,7 +26,7 @@ static int reset_of_xlate_default(struct reset_ctl *reset_ctl,
>  	debug("%s(reset_ctl=%p)\n", __func__, reset_ctl);
>  
>  	if (args->args_count != 1) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		debug("Invalid args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.33.0
> 

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
