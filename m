Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1CF59D46
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:55:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7F03C28E2F
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:55:09 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4673CC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:55:08 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id d17so6041391oth.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkqh0SIWehKTflP9aRiuFsdwtPDR2nHtAB7/7pi9DdU=;
 b=bMEQ97IH5/SvA7CO1FmhEt6CWn75qbKpjkAsraDzWDovej8aGUWYTIDxyky1qRVata
 aZzn01JCPTkH+q4sk6OKp98cplxvKF0H1cLgYu7qS022yO5hUxyLq7ZQ7Iizc0y8Yc0K
 nqX4KFgAmiDSjI1TiQGQfocuSFzjG86q+/nC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkqh0SIWehKTflP9aRiuFsdwtPDR2nHtAB7/7pi9DdU=;
 b=lpAQ9vFfnouUtf8jlWNDyhEytbMy3aYe81L506kL8QpMhLazVOU96cnadEU4vPgMER
 GeQ8NQkWsWffSzS9t88LigApaCqnN0rwPsx2vf/FIqsSihiVMZetSWd81J7/QosUQhTT
 n1T1JV2emozqs1J7zgY/yya6JVI0X94HGZ2smFJOHQZ+KczMckTv2BtXpuQKjlw+pae5
 ywUDpBaAGDbyt1sX+1SFO8VbT+iBpDSL352c13zBhPKmXtWAvnioz9jUK0H4upBtmVX0
 Grh8YpnKF6SmG4MwRU2K6rQDXcv/DKRJUuVLviJxcBWF2R7q1LyzxVA7bPaisimr/cn9
 BrfQ==
X-Gm-Message-State: APjAAAVMV0E1sSaXOXl+CpWKoxYSDaVhIMpjFHUy7ivOO4jaeTi/sv6b
 FmBhOTPdiJi6o1rjGUqZsRaa5+aGz++zRo8qkUuz7w==
X-Google-Smtp-Source: APXvYqyvHtn6gwC/tUY54YqRqMduu68oZzmy4e2iJw6pD649c/4xyqbOqfaHgK+TIcuID8SiMtv+9gIaG/mtc9iz1TY=
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr5342768oth.150.1561730106694; 
 Fri, 28 Jun 2019 06:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
 <1558459153-14104-2-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ3dB52XkkuRx6qvWFekfnZFpb4PL+A68kVAFUMshy9HYQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ3dB52XkkuRx6qvWFekfnZFpb4PL+A68kVAFUMshy9HYQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2019 07:54:55 -0600
Message-ID: <CAPnjgZ1bBtspuBDq_XfKw1kRdmuA8aoNFQpZEHCm3v5DVbDihA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] test: check u-boot properties in
	SPL device tree
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

On Tue, 21 May 2019 at 18:53, Simon Glass <sjg@chromium.org> wrote:
>
> On Tue, 21 May 2019 at 11:19, Patrick Delaunay <patrick.delaunay@st.com> wrote:
> >
> > Add a test to check the management of the U-boot relocation properties
> > for device tree SPL generation (fdtgrep result) and platdata:
> > - 'dm-pre-proper' and 'dm-tpl' not included in SPL
> > - 'dm-pre-reloc' and 'dm-spl' included in SPL
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v3:
> > - simplify test after Simon remarks by using fdtgrep on spl dtb
> >
> > Changes in v2: None
> >
> >  arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
> >  test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
