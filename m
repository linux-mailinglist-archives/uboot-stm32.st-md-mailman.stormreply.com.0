Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3ABE1D10
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Oct 2025 08:53:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C546C57192;
	Thu, 16 Oct 2025 06:53:18 +0000 (UTC)
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 629A4C36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 04:54:17 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E614E25F78;
 Thu, 16 Oct 2025 06:54:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u91iX7mqYvGu; Thu, 16 Oct 2025 06:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1760590456; bh=fs4oHPb2OIxpefS5s1KkAXnUyfFBSX6CJU84Y8g5d+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=SQQysX8u10sxBE4WuRt0pN6u2eXeg2DI/Xo2XjMDKPMXG3Ck5hp6oq/C0j7/KpxT9
 kJQDTKhRkH+oZsUQ9LjCHCB800uZTg0JzHTWoiyP67RMW870PCbh3W8hthi/B4VTOA
 vI8uR2EHRDLVE1THqQV+Nt0lqqzFVW35QoBoikBWaSXpC3gDOWv9KY9iVMITWaIwuL
 q3QRc0hVfy1Vv6Y2A4kK/oEF4sw7fR+J2YVZquLQhVQ6F1VT+hMw5WJLHGxc9mR23L
 tOteALgE77bdo7/EcnYI7anESZXEKlFXYOpaENlEDYrAaSIvl0KElcPSzHjOqvGiFw
 kCP1skA4/IVDA==
Date: Thu, 16 Oct 2025 04:53:40 +0000
From: Yao Zi <ziyao@disroot.org>
To: Andrew Goodbody <andrew.goodbody@linaro.org>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, Paul Barker <paul@pbarker.dev>,
 uboot-snps-arc@synopsys.com, Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 adsp-linux@analog.com, uboot-stm32@st-md-mailman.stormreply.com
Message-ID: <aPB6VPMiOcUknoJO@pie>
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <20251015-clk_ops-v1-4-5f80f827407e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251015-clk_ops-v1-4-5f80f827407e@linaro.org>
X-Mailman-Approved-At: Thu, 16 Oct 2025 06:53:17 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Alice Guo <alice.guo@nxp.com>, Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Sean Anderson <seanga2@gmail.com>,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Minkyu Kang <mk7.kang@samsung.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Hal Feng <hal.feng@starfivetech.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Joseph Chen <chenjh@rock-chips.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Shih <sam.shih@mediatek.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Sumit Garg <sumit.garg@kernel.org>, Jonathan Currier <dullfire@yahoo.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Michal Simek <michal.simek@amd.com>, Greg Malysa <malysagreg@gmail.com>,
 Heiko Schocher <hs@nabladev.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/24] clk: thead: th1520-ap: Remove
 negative error returns from clk_get_rate
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

On Wed, Oct 15, 2025 at 03:32:09PM +0100, Andrew Goodbody wrote:
> clk_get_rate() returns a ulong so do not attempt to pass negative error
> codes through it.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I want to switch to ccf_clk_* in the future, but this patch looks good
to me as a fix alone.

Acked-by: Yao Zi <ziyao@disroot.org>

Tested on Lichee Pi 4A board with no regression found.

Best regards,
Yao Zi

> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 6899e1b595a7148a118d3a615d5dfea4b4fb5b96..e913621967eb131b534e8f5b928687967a02a30e 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -985,7 +985,7 @@ static ulong th1520_clk_get_rate(struct clk *clk)
>  
>  	ret = clk_get_by_id(clk->id, &c);
>  	if (ret)
> -		return ret;
> +		return 0;
>  
>  	return clk_get_rate(c);
>  }
> 
> -- 
> 2.47.3
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
