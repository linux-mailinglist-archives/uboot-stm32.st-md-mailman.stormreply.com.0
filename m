Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA062EE1B
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Nov 2022 08:10:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 186C7C65067;
	Fri, 18 Nov 2022 07:10:08 +0000 (UTC)
Received: from smtp-out-04.comm2000.it (smtp-out-04.comm2000.it [212.97.32.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9022C6504A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Nov 2022 20:39:23 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-04.comm2000.it (Postfix) with ESMTPSA id 6E39EBC511F;
 Thu, 17 Nov 2022 21:39:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1668717562;
 bh=v++SDuwXmKrSl+j5aMWTHqKDRSCjkVNJFCG/E+k+1XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=MT9mhHACuVQoJEW77ImEu6PuK2l/tGDDCuMEPzkXsdKWJveMSJS4z5Nlum/TcU0bw
 oVY5ZhgsZi+QaXmDnQpqd4QfkErBChwksFwOQwkSHqrAY+9DObh4KiEofmZrGHL3D9
 XUyC/5DxiKtGvi1c/+DYVmpxMlUMnHGkS+NKQ7CVK6NatZcAPT01bPgfNpGCd0gSTf
 X8WoDnhDQk3NQVVLNkCPgSKwJasxczJ7IZi4ogOPf/zUCrd1FDD3npxE/GJnFJ9Eoo
 cpg/37qHUUYFn2hrVxGI99TgudTBOU08sbsyFxYuJlCJqAGnd3YQbeu+sJW+jAhd73
 XoejCnaTiOR4g==
Date: Thu, 17 Nov 2022 21:39:17 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Tom Rini <trini@konsulko.com>
Message-ID: <Y3ab9dxzTmIH8N9N@francesco-nb.int.toradex.com>
References: <20221108085222.1378781-1-max.oss.09@gmail.com>
 <20221108085222.1378781-2-max.oss.09@gmail.com>
 <20221108170911.klluse5h7km36vru@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108170911.klluse5h7km36vru@pali>
X-Mailman-Approved-At: Fri, 18 Nov 2022 07:10:07 +0000
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, Max Krummenacher <max.oss.09@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/1] u-boot-initial-env: rework make
	target
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Nov 08, 2022 at 06:09:11PM +0100, Pali Roh=E1r wrote:
> On Tuesday 08 November 2022 09:52:22 Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> > =

> > With LTO enabled the U-Boot initial environment is no longer stored
> > in an easy accessible section in env/common.o. I.e. the section name
> > changes from build to build, its content maybe compressed and it is
> > annotated with additional data.
> > =

> > Drop trying to read the initial env with elf tools from the compiler
> > specific object file in favour of adding and using a host tool with
> > the only functionality of printing the initial env to stdout.
> > =

> > See also:
> > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.s=
t.com/
> > =

> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> =

> Looks good,
> =

> Acked-by: Pali Roh=E1r <pali@kernel.org>

Hello Tom,
what's your plan for this patch? Any concern?

Francesco

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
