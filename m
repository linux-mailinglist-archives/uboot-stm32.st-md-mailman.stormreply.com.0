Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D06587E74
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 16:56:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43073C640F8;
	Tue,  2 Aug 2022 14:56:16 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0C59C640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659452165;
 bh=GM9JJ/473o8PkW8UaaJEEFrIJcuIV1hp470VyBv1Nu0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aWkn7S2B1Yumhs7he4GQy/3VhArhqzJOMs7td/X2gJg56gcYBvbujTjUqbTRaYbfr
 +qcbTB+BMaKhmN4iJwAxawEsxN+OUJOVr4s3Wn3/Own4pYzrJyEc4cV8eYrLuiziNg
 y3P5fUY6R4BUBrXKBHxTdrpYvjTwx07KMasHcmZI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([62.143.94.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDXp-1nQvBR3dcL-00udgA; Tue, 02
 Aug 2022 16:56:04 +0200
Message-ID: <b6f6e2af-741b-6de6-8b14-c69b8d4d333d@gmx.de>
Date: Tue, 2 Aug 2022 16:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220802090910.277343-1-patrice.chotard@foss.st.com>
X-Provags-ID: V03:K1:Wnlg3QrZN+0HXas2hdAkV54h4Jie1IaXVdR4IQkbwBBd//QURFj
 WGHLNz2Wn8UG1XZlTDEyxioONjoNHczdPqPLc6R+FZ0nFVnme9Rdzp2GshVM9sCYrZVJENK
 nfrWw/HbyQWSNgfeMRYO/cnCcMdVZ2TMPb27JxkuEWjdMyyEGjgCVg1cAjwUMiMBPMLTr3C
 7YxSS+EiGXU6XKTQI4aOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2GJRZvRT5ic=:NZsNbwPQTC22P7y4EkLe0j
 h5GGZLr8+Hca2TqwV9zCI0KNXcYwnVPWEGJcnVm8u9G+/Eh1x9hOQ5HlvexzmX7t7LpxGulu9
 kLh/EGb0p6tnw3OIDrEBFzjAiWLhJVJJz3DhD3g13NleOAH2p9DcMZbS1qTF+GL3je2DpjFUp
 HMuZ+i1ActyvVqzqZpdnNjda8h81XTCQwBO52emPVgQGqxnNCaKhcQFt299seinDX8+00JqQM
 dRuDQ7vxhfsgO52Ahe5SBjNdZ79wluSFgCwrZDqizasFvGNU7aWGwQBJQRTDSybMpL7py7A8k
 9tzlr/GMCxSATlrhi0Qo//bXL3kkG2QjOR++kt9yYsDQQo3dHmO1Ql7sENV9xnd+ZofLXBVSk
 gKUTkIHgGv+0O7kh7VqL67W6VYnfWiALmaSF+/xXVUYDCgh2nE2zwV8WBZB2CUJbZ4zqwQsxp
 I1ff0PX6s/U3eElbIzxZsrzZFeM5EGHXO3XRINdzbNmorebcwZcCsLbOSjKtaHl6yFhoYXDtU
 8MSsQtF1dVy1BLFVf2wP7ADnlCqp6dsfhsYZjlezLTI56X6GcC4EpHzW4+mDLC+VzKWjT4dy6
 +UQhksllFroSKN1dKfeZ3E/hImJ4wLGZddjBFXnf9LH0We/tL712BgjquZklAbEd8P+YsVy8H
 tL5p8nLyXiuddkH94bqMoWSUv/e/46ClRwqLyUhZUYSrf+/pfjXa3T7NkiigxcjGb7YiwWW86
 yfzP+3zYy3Sgp230Abdzw3eIaYJNaW+E2j3I/zGgKGXjnLT6wmPXlczcbQnu7+h5rMOxb/0Ke
 qPuygC6rVxYap+sfWg4IGfM05SOWSovK+QwS/6hW5hfZLJameyuVs4nC/k4nxA/Ggi3S4JRLd
 CyMnB0ALFTyxscZHjuaqjhb/ZD+rDFmPM+MiCSiF2obiOVN/9KDHVDC8q+fXZVLvKDYUSYN8W
 U77N84YGO+dCmY/CkZDGFQWgYo8gkYyS2U9NogMbBetNp502yMW/8zkTZL28jWLik9d3qMWD3
 7yZWUuEK5RtZBFn8QjfICIugg5rGwR2d0suaOVVjFPbUbkjHmklo585sNiPk8M8TBWdsemEeE
 9i1Ys+Ydx1ahoHgR2lbUwzBc9TXswd9DxxVvNABw65W9LryKq67XtfAdQ==
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Simon Glass <sjg@chromium.org>, Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 0/3] gpio: update gpio_get_status()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 8/2/22 11:09, Patrice Chotard wrote:
>
> Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
> without any other information. It would be interesting, if information is
> available, to indicate which pinmuxing's name is used.

Maybe you can add on top of my gpio man-page patch a description of the
output fields of gpio status.

[PATCH 1/1] doc: man-page for gpio command
https://lists.denx.de/pipermail/u-boot/2022-August/490666.html

Best regards

Heinrich

>
>
> Patrice Chotard (3):
>    gpio: Allow to print pin's label even for pin with GPIOF_FUNC function
>    gpio: Fix pin's status display for pin with GPIOF_UNUSED function
>    pinctrl: pinctrl_stm32: Populate uc_priv->name[] with pinmux node's
>      name
>
>   drivers/gpio/gpio-uclass.c      | 18 ++++++++++++------
>   drivers/pinctrl/pinctrl_stm32.c |  8 ++++++--
>   2 files changed, 18 insertions(+), 8 deletions(-)
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
