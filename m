Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9DA870BC9
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 21:48:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2CAEC6DD65;
	Mon,  4 Mar 2024 20:48:22 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CEB0C6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 20:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1709585196;
 bh=yue8JLPupABBdqygA0EMatoBvWzc9y+LdbG73Zrk0is=;
 b=Vt7WvtQ/mXKIqVti6zVIjmDKA82uMcv3uOhZznPHiDKLAr81DgLoTBTR6hzzCmZCyhDOW99iH
 Fjgq2M7kMTQsHJXk9yI2FRE50Zv9ZDTFI6NKkboWKGT9bPJe48KBgCL96Dl2aRYDcg04MwnM1bv
 8AJHl8qqMed5wRjw/rRp6Ha42mB4X1HquUpa1hdHK5/+pOmf2OFFugGCFuhUFU5iMeYQBG3Xn/7
 VpK1kboX6yW3EcKU8E9qiVNUAPjqCukqlTLwQhkQREvoOjVDONsOXRIxXzM1pzGCmCH4iNYYvRi
 hQ3oxkRUTw6cepx1wYXzlLDiT2zFCGNoRE8zRI0v3Miw==
Message-ID: <e6285379-d4c9-45b7-8913-bcf27c52bbda@kwiboo.se>
Date: Mon, 4 Mar 2024 21:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Caleb Connolly <caleb.connolly@linaro.org>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-10-b7ff41925f92@linaro.org>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-10-b7ff41925f92@linaro.org>
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 65e62de5a5d3328d0fcb4c53
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@amd.com>,
 Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot-amlogic@groups.io,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Dai Okamura <okamura.dai@socionext.com>,
 Sumit Garg <sumit.garg@linaro.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Rick Chen <rick@andestech.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 10/26] rockchip: drop remaining
	dt-binding headers
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

Hi Caleb,

On 2024-03-04 17:51, Caleb Connolly wrote:
> Drop in favour of dts/upstream.
> 
> Small driver adjustment to fix compatibility.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/pinctrl/rockchip/pinctrl-rk3568.c         |  15 +
>  include/dt-bindings/pinctrl/rockchip.h            |  60 --
>  include/dt-bindings/power/px30-power.h            |  27 -
>  include/dt-bindings/power/rk3066-power.h          |  22 -
>  include/dt-bindings/power/rk3188-power.h          |  24 -
>  include/dt-bindings/power/rk3228-power.h          |  21 -
>  include/dt-bindings/power/rk3288-power.h          |  32 -
>  include/dt-bindings/power/rk3328-power.h          |  19 -
>  include/dt-bindings/power/rk3399-power.h          |  53 --
>  include/dt-bindings/power/rk3568-power.h          |  32 -
>  include/dt-bindings/power/rk3588-power.h          |  69 --
>  include/dt-bindings/power/rockchip,rv1126-power.h |  35 -
>  include/dt-bindings/reset/rockchip,rk3588-cru.h   | 754 ----------------------
>  include/dt-bindings/soc/rockchip,boot-mode.h      |  16 -
>  include/dt-bindings/soc/rockchip,vop2.h           |  18 -
>  15 files changed, 15 insertions(+), 1182 deletions(-)
> 
> diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3568.c b/drivers/pinctrl/rockchip/pinctrl-rk3568.c
> index 1d4391982605..35a69c2a1a28 100644
> --- a/drivers/pinctrl/rockchip/pinctrl-rk3568.c
> +++ b/drivers/pinctrl/rockchip/pinctrl-rk3568.c
> @@ -11,8 +11,23 @@
>  #include <dt-bindings/pinctrl/rockchip.h>
>  
>  #include "pinctrl-rockchip.h"
>  
> +#define RK_GPIO0	0
> +#define RK_GPIO1	1
> +#define RK_GPIO2	2
> +#define RK_GPIO3	3
> +#define RK_GPIO4	4
> +#define RK_GPIO6	6
> +
> +#define RK_FUNC_GPIO	0
> +#define RK_FUNC_1	1
> +#define RK_FUNC_2	2
> +#define RK_FUNC_3	3
> +#define RK_FUNC_4	4
> +#define RK_FUNC_5	5
> +#define RK_FUNC_6	6

I would suggest to just drop the RK_GPIO and RK_FUNC_ prefix in the
table below instead of having to define these here.

Regards,
Jonas

> +
>  static struct rockchip_mux_route_data rk3568_mux_route_data[] = {
>  	MR_PMUGRF(RK_GPIO0, RK_PB7, RK_FUNC_1, 0x0110, RK_GENMASK_VAL(1, 0, 0)), /* PWM0 IO mux selection M0 */
>  	MR_PMUGRF(RK_GPIO0, RK_PC7, RK_FUNC_2, 0x0110, RK_GENMASK_VAL(1, 0, 1)), /* PWM0 IO mux selection M1 */
>  	MR_PMUGRF(RK_GPIO0, RK_PC0, RK_FUNC_1, 0x0110, RK_GENMASK_VAL(3, 2, 0)), /* PWM1 IO mux selection M0 */

[snip]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
