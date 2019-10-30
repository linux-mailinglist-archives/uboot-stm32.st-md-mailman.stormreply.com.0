Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE83E94CD
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B311BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:18 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A56FBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id d8so712365otc.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ScGcPH4W1Go0RSrK/ukMHQe+F0NY8zG/tIe2Wvcjb1Y=;
 b=TjsFv5KkrTAnK71KFlzsdr3FiCNg6gi8QR9C4C6FlEC44vzQqhQmvLOcJrmFVDgXLz
 PQt7OeEHotjn+z0IRQKLfIjmDDacoYvt1BjO1k3rPN3dzR6Pvy3sNQ0DBVEu+kX1bZHN
 pfCqLEwD6/68AxXHkCZ+pg4Cbfjaz+0rg1Tl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ScGcPH4W1Go0RSrK/ukMHQe+F0NY8zG/tIe2Wvcjb1Y=;
 b=bPP7koJlGWCV3v7hhUKH3kK34nHsFcK/PD66dIXJZYWMDksgWiDFq8AOHuLlCD7ToC
 hkNIxEqOHsd5fDQFYY14W59E35ybcI6RrqP0WYEjr+L2+oE0VPn/twhzlTj6gB6TZnwH
 rHYH8Pi0wQwXVCi5Xa3f+LaTU3PxVEk+LLQcQefRD8yHuk+bZJi73S508kF3B7vPqzTw
 +QoKrnMwYyDgfLNjpwN3n8Mx9PxFZIDpxII/WIU8ygx6WET7yClQJ1JHt7VQuVNtkylh
 svujFqwwj+Xjml2oeA7pSQTOjZxpyy5rxDNbl1RbAf+XLdBdCa4fCoUBi3EaM+NUlbnd
 kzug==
X-Gm-Message-State: APjAAAU0ykUBRS+8dnEiFEx+LQ7SPcYZ8jWD1WKANC6MIdRSD/5dGAoD
 zOpBt0pNXCLxhTM4MZKo1VFJkybA6M0jYdEogAElgA==
X-Google-Smtp-Source: APXvYqzAytrELkQaUiq47fwSC+w8ijaZDilRtJesL/Uds+WAgCOeVMUD4MulmoWVRRKX5VWdWiDItLHGvUNIaOuDK0o=
X-Received: by 2002:a05:6830:2316:: with SMTP id
 u22mr9358699ote.100.1572400094881; 
 Tue, 29 Oct 2019 18:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-2-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:02 -0600
Message-ID: <CAPnjgZ2O7jWSjMptLY3DQTDeB-aTE+Lq2UOoQdDcPtTkT16adg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Lukasz Majewski <lukma@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 01/13] pinctrol: dm: remove the function
	pinctrl_decode_pin_config
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

On Wed, 23 Oct 2019 at 07:44, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Remove the pinctrl_decode_pin_config() API, because this
> function is unused and not compatible with livetree
> (it uses fdtdec_get_bool instead of ofnode API).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-uclass.c | 12 ------------
>  include/dm/pinctrl.h             | 13 -------------
>  2 files changed, 25 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
