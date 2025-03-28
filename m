Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E2BA74EFD
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 18:15:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8B0EC78F7F;
	Fri, 28 Mar 2025 17:15:30 +0000 (UTC)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7336C78F77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 17:15:29 +0000 (UTC)
X-KPN-MessageId: 4054062e-0bf8-11f0-8ec8-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 4054062e-0bf8-11f0-8ec8-005056994fde;
 Fri, 28 Mar 2025 18:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=subject:to:from:message-id:date;
 bh=K07dj9Xx91hkVvGsk8cWy6gBfKqa5bFQpE+aVuD86LE=;
 b=mFgJj5VK6uEGn56J89jCt215lWS4PhdW8DcWN8GjjHrk7Y9qbk179eNdmKaHz4e6KE3NVunst+NJM
 XPWHiPpCklrKnruOLOFiLxYYtmzMt4XsMsAaSWZI9otHJshb9RD2l/qcZm8kIaZX1KJt6uIF0x3ke9
 ImmkEolTft2ShOsUPEwj/blj4suZsNN1jM8J3I5qRpVA11vj5ZPwuzQN0lPl1SoqdltUoDQq9OEV4e
 e5v5KvrLMywbZ6vD7mj0NpoLL2dQMZMLZA+ilmfHwA5TlFi8H9y5kUAVfj5xGoA907xKS2CiJ8O1q1
 YU5uu4GT0dUXLPBtcx6+jduQyDYlp8g==
X-KPN-MID: 33|d/wfbBmXKaISssM75zcAVTXHpm5D6Us9LK8txokjAULPOMzPR2TAUU7Z5M8WxMX
 tD2l+HJJ6K6QFYg7V0tX40HMbE8zk+2+X0TAw4+JvOAs=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|2UqczDH6PMFp9tVwjR9fNx6LBjBJI1dXXN18e+fkYU3MuXtrNMgtu2Ow9R+mE6Y
 vVtpEWDHjoGQPqooGvO4ZMw==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net
 [80.61.163.207]) by smtp.xs4all.nl (Halon) with ESMTPSA
 id 3e3e2756-0bf8-11f0-99e4-00505699772e;
 Fri, 28 Mar 2025 18:15:28 +0100 (CET)
Date: Fri, 28 Mar 2025 18:15:27 +0100
Message-Id: <87wmc95b68.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Tom Rini <trini@konsulko.com>
In-Reply-To: <20250328160419.GX93000@bill-the-cat> (message from Tom Rini on
 Fri, 28 Mar 2025 10:04:19 -0600)
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
 <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
 <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
 <20250328160419.GX93000@bill-the-cat>
Cc: peng.fan@nxp.com, vincent.stehle@arm.com, u-boot@lists.denx.de,
 jj251510319013@gmail.com, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.rudolph@9elements.com, udit.agarwal@nxp.com, xypron.glpk@gmx.de,
 Manish.Tomar@nxp.com, Oliver.Gaskell@analog.com, wasim.khan@nxp.com,
 matt@traverse.com.au, duje.mihanovic@skole.hr, tien.fong.chee@altera.com,
 e@freeshell.de, rayagonda.kokatanur@broadcom.com, adrianox@gmail.com,
 Ashish.Kumar@nxp.com, semen.protsenko@linaro.org, sumit.garg@kernel.org,
 sughosh.ganu@linaro.org, alif.zakuan.yuslaimi@intel.com,
 lukas.funke@weidmueller.com, robert.marko@sartura.hr, michal.simek@amd.com,
 mingkai.hu@nxp.com, raymond.mao@linaro.org, caleb.connolly@linaro.org,
 andy.tang@nxp.com, priyanka.jain@nxp.com, sjg@chromium.org,
 ilias.apalodimas@linaro.org, maks.mishinfz@gmail.com,
 meenakshi.aggarwal@nxp.com, patrick.delaunay@foss.st.com
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> Date: Fri, 28 Mar 2025 10:04:19 -0600
> From: Tom Rini <trini@konsulko.com>
> 
> On Fri, Mar 28, 2025 at 02:26:39PM +0200, Ilias Apalodimas wrote:
> > On Fri, 28 Mar 2025 at 13:34, Simon Glass <sjg@chromium.org> wrote:
> > >
> > > Hi Ilias,
> > >
> > > On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
> > > <ilias.apalodimas@linaro.org> wrote:
> > > >
> > > > Hi Simon
> > > >
> > > > On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
> > > > >
> > > > > Hi Ilias,
> > > > >
> > > > > On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
> > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > >
> > > > > > Hi Heinrich,
> > > > > >
> > > > > > On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > > > > > >
> > > > > > > On 17.03.25 14:38, Ilias Apalodimas wrote:
> > > > > > >
> > > > > > > %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
> > > > > > >
> > > > > > > > The EFI subsystem defines its own bounce buffer for devices that
> > > > > > > > can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> > > > > > > > which can be reused instead of defining another symbol.
> > > > > > > > The only limitation for EFI is that we don't know how big the file a user
> > > > > > > > chooses to transfer is and as a result we can't depend on allocating the
> > > > > > > > memory from the malloc area, which can prove too small.
> > > > > > > >
> > > > > > > > So allocate an EFI buffer of the correct size and pass it to the DM,
> > > > > > > > which already supports bounce buffering via bounce_buffer_start_extalign()
> > > > > > >
> > > > > > > Looking at
> > > > > > >
> > > > > > >      if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
> > > > > > >
> > > > > > > in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
> > > > > > > enabled by the device driver. Only the scsi drivers sets bb = true.
> > > > > > >
> > > > > > > Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
> > > > > > > to blk_desc")
> > > > > > >
> > > > > > > Which device-drivers of the boards mentioned below do actually need
> > > > > > > bounce buffering?
> > > > > >
> > > > > > Unfortunately, I don't have any of the hardware to test and I havent
> > > > > > worked with that platform much.
> > > > > > That 'bb' variable and the fact that EFI needs bigger allocations is
> > > > > > why I ended up allocationg properly aligned memory from the EFI
> > > > > > subsystem. But as Mark pointed out, the cache flush is a no go for
> > > > > > now, so I'll drop this and see if I find time to rework the bounce
> > > > > > buffer logic overall
> > > > >
> > > > > There was quite a bit of discussion about all this in the context of
> > > > > my attempt to just add a message to warn the user[1]
> > > > >
> > > > > We might consider adding an event to reserve memory before relocation,
> > > > > along with a way to discover (in board_r) where the memory was
> > > > > allocated. That would make the solution more generic.
> > > >
> > > > I am not sure what you are trying to solve here. The EFI bounce buffer
> > > > after the LMB patches can't overwrite memory, nor can it be
> > > > overwritten.
> > >
> > > I am thinking of we can create a single implementation of the
> > > bouncebuf logic which also works for EFI.
> > >
> > > I think the two sane things to do are:
> > > - restrict U-Boot to using memory below 4GB for platforms which have
> > > the DMA limitation
> > 
> > You don't need that. The bounce buf code has a callback you can use to
> > define the limitations
> > 
> > > - create (in board_f) a special region below 4GB for use with the
> > > bouncebuf logic
> > 
> > The only problem with EFI is that you don't know how much memory it
> > needs and we can't use the existing memalign calls. So if we replace
> > that memalign in the bounce buffer code, with an lmb reservation we
> > have everything we need.
> 
> It's not even an EFI problem is it?

Fundamentall, yes, this isn't an EFI problem.

> You could hit the same problem reading a file from a filesystem
> outside of EFI too.

Yes, but we tend to choose the addresses in the env variables that are
used in the more traditional boot methods to prevent this.

> These specific SoCs just aren't heavily exercised is one of the
> challenges I think and so it's possible that we have a few things to
> yet improve in the bounce buffer code (which was added for other
> SoCs and done as generic enough starting point for others).

The existing bounce buffer code was written to solve a completely
different problem.  But it could indeed be generalized to solve this
problem as well.  That requires somebody willing to work on a larger
set of actual hardware that includes SoC with cache-coherency
challanges (which is what the current bounce buffer implementation is
there for) and SoCs with DMA addressing challenges.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
