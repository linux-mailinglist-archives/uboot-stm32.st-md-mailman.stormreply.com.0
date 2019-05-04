Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFB141F3
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 May 2019 20:42:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B7FEC06131
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 May 2019 18:42:10 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B423C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 May 2019 20:16:05 +0000 (UTC)
Received: from localhost (unknown [172.20.6.135])
 by mail.nic.cz (Postfix) with ESMTPS id 15B5163711;
 Sat,  4 May 2019 22:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1557000964; bh=6+/1wi57TLark2yoOke/1i50buqwp9vOBrYtI12exXA=;
 h=Date:From:To;
 b=MRMvvIV3pWhe7tV5vizV9G6BGqZq7I35N1aVhf1zLvVkomn6OelEOfnWnfpjp7UIO
 CVvkqTW3LUBwW3Z/bfupTKJlECLx3W61ya+3/0N/HE4xpqCJe4EMYEhoTV/KDIutul
 qy4UX7sRYgz21YZa2LpwHJlgjFsk7rhohmhrm0Ds=
Date: Sat, 4 May 2019 22:16:01 +0200
From: Marek Behun <marek.behun@nic.cz>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <20190504221601.4f02f4ea@nic.cz>
In-Reply-To: <20190504200356.22099-1-simon.k.r.goldschmidt@gmail.com>
References: <20190504200356.22099-1-simon.k.r.goldschmidt@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
X-Mailman-Approved-At: Sun, 05 May 2019 18:42:07 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Christophe Kerello <christophe.kerello@st.com>,
 Vignesh R <vigneshr@ti.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alex Kiernan <alex.kiernan@gmail.com>, u-boot@lists.denx.de,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Abel Vesa <abel.vesa@nxp.com>,
 Sumit Garg <sumit.garg@nxp.com>, Jagan Teki <jagan@openedev.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Stefano Babic <sbabic@denx.de>, Shengzhou Liu <Shengzhou.Liu@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, York Sun <york.sun@nxp.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Mian Yousaf Kaukab <ykaukab@suse.de>, Ashish Kumar <ashish.kumar@nxp.com>,
 Jeremy Gebben <jgebben@sweptlaser.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Bin Meng <bmeng.cn@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Po Liu <po.liu@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Andrew
 F. Davis" <afd@ti.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Mario Six <mario.six@gdsys.cc>, Lukasz Majewski <lukma@denx.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] spl: kconfig: separate sysreset and
 firmware drivers from misc
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

On Sat,  4 May 2019 22:03:56 +0200
Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com> wrote:

> diff --git a/include/configs/turris_omnia.h b/include/configs/turris_omnia.h
> index 018f54428b..7cffdc3d51 100644
> --- a/include/configs/turris_omnia.h
> +++ b/include/configs/turris_omnia.h
> @@ -52,6 +52,8 @@
>  #define CONFIG_SPL_STACK		(0x40000000 + ((192 - 16) << 10))
>  #define CONFIG_SPL_BOOTROM_SAVE		(CONFIG_SPL_STACK + 4)
>  #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
> +#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
> +#define CONFIG_SPL_SYSRESET_SUPPORT

These are not required for Turris Omnia, only
CONFIG_SPL_DRIVERS_MISC_SUPPORT for ATSHA204A.

Marek
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
