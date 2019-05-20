Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A623C3E
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 17:36:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE02C5EC47
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:36:12 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 252C7C5EC42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:36:11 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 14so12909714ljj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTkGyb50aTJS1ZlWTrbKnaY9d2dpxX4QIxgXXR5MVqU=;
 b=b6xM3px7Uf3Fkpvzs6BO6orxJSTo1OaqhCtJRB6ODe4kMlGKCugiQFowXunaRQ2YL+
 4a/2UyjB2vFbVLAja5KPX9Tm23XiOKrJuV5wDLbnqbC2+dB2vGjT9JP4FLLHGI5eGhvU
 cXyk9jaWdyB4KfjrgJq30brRh1UAPDm5wj9rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTkGyb50aTJS1ZlWTrbKnaY9d2dpxX4QIxgXXR5MVqU=;
 b=nogy7KP4Ai/1Rp8GdZPIg/s6ze9BSOWRVHSB6jJRohSsY0DojIFqdNSywi2KXxa6mB
 oDHrnozfhDLAqS4dLSFjB6cupGe+oWxYuR7VsKSn3Y93uI8D5k3LPC1jYTz5z7UCzGhf
 C755ISLf2iV0bR5QIzNswX4LcyDuDx+Cru2IhSuOh6CbpcflIcOVJoUiiWc/ZhNumPo9
 +zm8czzs5m7DX6NxoOn7xYpgGUlHfavsCkpwRc+Rp5fY2IBlY+AAigzPIT9ubddVNAYR
 dVyrCPbswuN8nPNOG5gNW7vEal1vRQRrbSbsB85UiII8K5bCcYw0+WA1ao1EaHm2o2Wp
 lx8Q==
X-Gm-Message-State: APjAAAW7VXhW9JahXtaWUVBbgHWjdiis3IMgrZWKOIA7y2V0//pmsnSj
 4g5TPraQFFEMF3l0gs246gFeIpLWfCKe16j4zYQHEA==
X-Google-Smtp-Source: APXvYqynUsFeCgavlSJ6jTtyfIQD+EhyIg/sIOSWzM0gve/bzEjQkl4hbNwje1NMxJ9asIDkp8Loo78edLu3Kb/rggo=
X-Received: by 2002:a2e:3611:: with SMTP id d17mr16099673lja.72.1558366569757; 
 Mon, 20 May 2019 08:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 09:35:45 -0600
Message-ID: <CAPnjgZ12YVhUwTELM6D3R7FkSJAx+1Y5urnzxSsk5vA07dszdA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tien Fong Chee <tien.fong.chee@intel.com>, Bin Meng <bmeng.cn@gmail.com>,
 Stephen Warren <swarren@nvidia.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Igor Opaniuk <igor.opaniuk@linaro.org>,
 Alexander Graf <agraf@suse.de>, Jens Wiklander <jens.wiklander@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Paul Burton <paul.burton@mips.com>,
 Mario Six <mario.six@gdsys.cc>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Anatolij Gustschin <agust@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/8] fdt: Allow indicating a node is
	for U-Boot proper only
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

Hi Patrick,

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
>
> Hi,
>
> I create this v2 serie with:
>
> 1/ documentation update for previous patch
>    [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
>    http://patchwork.ozlabs.org/patch/1081155/
>
>    PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
>        pre reloc properties in SPL and TPL device tree")
>        but not the documentation.
>
> 2/ missing part for (patch 1/2)
>    http://patchwork.ozlabs.org/project/uboot/list/?series=89846
>
> 3/ new tests for pre-reloc propertie in SPL as suggested by Simon
>    (http://patchwork.ozlabs.org/patch/1081155/#2156621)
>
> Tell me if is better to split the serie.

Somehow this cover letter appears in a patch, hence some of my
confusion. I see what you are doing and it is a comprehensive
approach.

But please see my comments about comparing the .dtb file instead of
making sandbox print it out.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
