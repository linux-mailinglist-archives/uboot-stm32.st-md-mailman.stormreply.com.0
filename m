Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBE613857
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Oct 2022 14:47:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80130C0AA15;
	Mon, 31 Oct 2022 13:47:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC8A3C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 13:47:40 +0000 (UTC)
Received: from crub (pd95f184a.dip0.t-ipconnect.de [217.95.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2AD9E8521A;
 Mon, 31 Oct 2022 14:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667224059;
 bh=+qZz5VOv+X1OnXYNOlpaOnb9RsEanKYIGBljjt2/EKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sdo+KZGdmxr1AFief0LHPwSgFJZAHMn0l8Y7xy+hVYgfoTkgqsiRYcuX8hTy5mDgd
 M8+9drmfNmFQ5pHzU7VLtL04GrzcbUhIxwGhe5S2Oei0Dg/Kt3GrPrYuz4AOUs8fPy
 TbBxymg8Z1r8X9QHhZQnGJFGEhTcbMStnJEYO6rWXBrfpJgl40u0JXfvS9sJv4twO6
 pXoJJE3FJTUNb40XJRZ1gkGkygFQh8dKGCygUe6cE8J/1T8slYKDvqeXjPYxPOUjVJ
 H92WTqG28xwmWXtC7J6N0FyOg5jetv6ypkTyf4+DXumWbeNz+aGUNA2gVz4dM5Yy46
 FGPOh3Sq1seEw==
Date: Mon, 31 Oct 2022 14:47:36 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20221031144736.5b645659@crub>
In-Reply-To: <20221019112356.1042065-1-sjg@chromium.org>
References: <20221019112356.1042065-1-sjg@chromium.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Stephen Warren <swarren@wwwdotorg.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Wolfgang Denk <wd@denx.de>,
 Marek Vasut <marex@denx.de>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>, Ian Ray <ian.ray@ge.com>,
 Minkyu Kang <mk7.kang@samsung.com>, Rui Miguel Silva <rui.silva@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Sven Schwermer <sven@svenschwermer.de>, Jason Liu <jason.hui.liu@nxp.com>,
 Mario Six <mario.six@gdsys.cc>, Harald Seiler <hws@denx.de>,
 Vikas Manocha <vikas.manocha@st.com>, Icenowy Zheng <icenowy@aosc.io>,
 Ye Li <ye.li@nxp.com>, Bharat Gooty <bharat.gooty@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Ilko Iliev <iliev@ronetix.com>,
 Ovidiu Panait <ovpanait@gmail.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Andrew Scull <ascull@google.com>, Suniel Mahesh <sunil@amarulasolutions.com>,
 Jens Scharsig <esw@bus-elektronik.de>, Michal Simek <michal.simek@amd.com>,
 =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Antti =?UTF-8?B?TcOkZW50YXVzdGE=?= <antti.maentausta@ge.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Artem Lapkin <email2tema@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Jesse Taube <Mr.Bossman075@gmail.com>, John Keeping <john@metanate.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alban Bedel <alban.bedel@avionic-design.de>
Subject: Re: [Uboot-stm32] [PATCH 00/39] lcd: Drop old LCD support
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

Hi Simon,

On Wed, 19 Oct 2022 05:23:17 -0600
Simon Glass sjg@chromium.org wrote:

> The conversion to DM_VIDEO was completed some years ago. The old video
> code has been removed but the LCD code remains. This series removes it,
> to complete the driver model migration.
...

Series applied to u-boot-video/master, thanks!

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
