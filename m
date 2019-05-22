Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD625B5D
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 02:53:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33414C90084
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 00:53:42 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC895C90084
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 00:53:40 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w9so300644oic.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 17:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GkTfAoM6Ns9GQ8XXM9gWb7/5r6hVhCQVgA/49NWR664=;
 b=iDtPpGN4hufjPCUYCgFqfp8ESdi4L3BiMjTPxwNH6pmmeJRk0td6BTUl43BHqlRC0j
 AInQ+MZk0g4SR3wBmZSIpJvt0inp/LLjk81ibqjsGJPiBJsbfeGfS42vG9Z15j/Udgwk
 bqyEVssTeuEMGkSYp7xYdHDix27EwDJXt8BsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GkTfAoM6Ns9GQ8XXM9gWb7/5r6hVhCQVgA/49NWR664=;
 b=YN/WEPjqCDin9X7EtOStw1H4hH0gwqKIaXxX+wxqtTTBEeHPxt6vWz8uekbXmk0peB
 2AjwG7nu6RN34nEjNaf92pLgFroqh7a/EspY+TiOJbUnF2w7VJLfB9YrL35rdFJF4AU2
 VHOkQps2vIWRjpTKGdMJJQzUHA2baHuA1urgSdiUZvGxtx3IdIRdlQmUrtSmqoUXdsvO
 KZy38iBVg5CIm0XcgJokcejI3HCPffvD9m7N0Y0RbbsQTrYWyS9/U0xHKFro/LWUH9HO
 w4Ojun7qGqVR+LP1WYH8yuFzO4bsTKaTFMVdei+BlVoaBckba0+uTV94ARzODLs3cFM7
 NOlw==
X-Gm-Message-State: APjAAAV/7TITAt3GWdb7896NW6YTEpk+5qKZ7ZkxcciINGuPSXo2tIFx
 KHSJLJa6Hu/OyJexlCG36xCvZiv1iYhVz/si7kKZDg==
X-Google-Smtp-Source: APXvYqwR16/OvZYhMI4rM4J+lFtni8wo7DsMPrprKByRtgQ40zEUcRJfpByOXfDKBrN7iLzJTtPSqaGwDEaUYpivD0c=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr5610370oib.170.1558486419125; 
 Tue, 21 May 2019 17:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ12YVhUwTELM6D3R7FkSJAx+1Y5urnzxSsk5vA07dszdA@mail.gmail.com>
 <f83446fc16414f1fa8d06ca6906dc906@SFHDAG6NODE3.st.com>
In-Reply-To: <f83446fc16414f1fa8d06ca6906dc906@SFHDAG6NODE3.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 May 2019 18:53:26 -0600
Message-ID: <CAPnjgZ1PrHkY494iD8oqndNO2-niupBjrcs3c7dzvV1M1s3y3Q@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
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

On Tue, 21 May 2019 at 10:07, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>
> Hi Simon,
>
> I will reply for the serie
>
> > Hi Patrick,
> >
> > On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com>
> > wrote:
> > >
> > >
> > > Hi,
> > >
> > > I create this v2 serie with:
> > >
> > > 1/ documentation update for previous patch
> > >    [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
> > >    http://patchwork.ozlabs.org/patch/1081155/
> > >
> > >    PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
> > >        pre reloc properties in SPL and TPL device tree")
> > >        but not the documentation.
> > >
> > > 2/ missing part for (patch 1/2)
> > >    http://patchwork.ozlabs.org/project/uboot/list/?series=89846
> > >
> > > 3/ new tests for pre-reloc propertie in SPL as suggested by Simon
> > >    (http://patchwork.ozlabs.org/patch/1081155/#2156621)
> > >
> > > Tell me if is better to split the serie.
> >
> > Somehow this cover letter appears in a patch, hence some of my confusion. I see
> > what you are doing and it is a comprehensive approach.
> >
> > But please see my comments about comparing the .dtb file instead of making
> > sandbox print it out.
>
> I will change the test to only compare the device tree : it is more simple.
>
> => v3 in few days
>
> My first approach was complicated but it is to allow
> - check if sandbox SPL with devicetree and libfdt in working as is already done for platdata
> - check if sandbox SPL can start U-Boot in booth case
>   (by executing the simple test_000_version in ./py/tests/test_000_version.py)
> - split test and normal device tree (I move the "spl-tests" nodes in test.dts)

Yes, certainly this is useful and it does provide an end-to-end sanity check.

But if we do this I think it should be *in addition* to smaller test.

So could we start with the simpler, smaller test and then see how far
that gets us? I am not saying that the functional test is bad, but if
something goes wrong with the test, there are a lot of pieces to look
at to figure out what went wrong.

>
> But it is too complicated just the purpose of this test.
>
> NB: the executable "u-boot-spl" for sandbox_spl_defconfig already
>        include the devicetree information, with platdata.

Yes.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
