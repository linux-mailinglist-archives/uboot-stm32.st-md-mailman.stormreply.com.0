Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47FA74E77
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 17:19:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24614C78F77;
	Fri, 28 Mar 2025 16:19:47 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61189C78F75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1743178661; x=1743783461; i=xypron.glpk@gmx.de;
 bh=cWg3A5ISrGdswXEuTMTrP5/SOEdGzEW+NELvMdHAuok=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eJ0a4BdpE+NS6znJmoa/ZfmaKvffmS09ewv+S/oNE7FcvVxNlpwBKQPR3x6JCrPq
 /Rf8OMbgTh1q+UGxEQkbaE1Al+X6f3fVz9tSPnqPc9p6MJNCDw/9K3faDIfxLeW16
 HRf3uV1jzZ1WpurqL53ct263o8VtuhAAqZrxfymEr62Ukk+NaKAKWNNUW3VraBN0k
 G41vYGRHqACKdohNS8fjlE6U4eVfnSODsPBa5jZbuW0jogB3Elsv8Q0Pnne2iV5La
 MwgoQ/TLK8t8T9qJV/s4UicjpX6JlLCqI8ViI7a5/VkkDe94WbxZ4iNLN1dzY94eu
 Kk1DdPUhrqeVzsww/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.103.102] ([5.147.80.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1tsCeI3l6U-002LAS; Fri, 28
 Mar 2025 17:17:41 +0100
Message-ID: <2c9efc39-b0b9-41e7-b42e-1d026bc286a7@gmx.de>
Date: Fri, 28 Mar 2025 17:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
 <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
 <CAC_iWj+DazCNrMktmwJQxt7bVPbu-qWCfjW4bgcv0cngiH03gw@mail.gmail.com>
 <CAFLszTgq25-E-n+UaJ_wRdimCLcAta-fetWpOW++NCOfN_eL5w@mail.gmail.com>
 <CAC_iWjLS_yNPCMY2RhGZ0390ZysH=N5x5JZ-qOnNjX7nofPS4Q@mail.gmail.com>
 <CAFLszThhK4-+Qh_eQLD0fuJZVodBkwit4rw5mOcGU58m6=5knw@mail.gmail.com>
 <CAC_iWj+2EsRUBT5ThAR7+wwxVkFSzrApCNDbTEEHQ-W658LwCw@mail.gmail.com>
 <20250328160419.GX93000@bill-the-cat>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20250328160419.GX93000@bill-the-cat>
X-Provags-ID: V03:K1:4NUy4chyS+kg65suL0KnwLHGbAyTf/H06weogu7zLawvkBcJKrl
 hHKr84K1V83n2vKHAyGem3d37Se9g5nY2g4oQ17y5ab1n3XowajBSTG9tZajOZUda1smqD+
 wEoFUtG2bi1efu8qlu2e/KDXMd5vl5WHdATu3A6wfPEAzvmMLKz8NNQinmcNrOU0NYnsZi8
 cfZldbRTYSfQRi+6vYz4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kdzq82JvEOE=;+m6C/VUgfE//HGb6337rfHmeIix
 AJEnuGdCqZyXOx0P1r/jaKDMMW/eGfd9ROVyqAGBFeV06zhgk1r1RUx3YPxEE4QWbFfFnnIXe
 OoxJuBSJoAWz5JVBvSjGm8mtr9fiur70SDW86woBWLHb1RlPRPtOY5mnxRE7VkF+fBFQQzNk4
 aqOJ+fWCQhicts4JVAhDKJNh6M30uFnDDjE5HROz/B/ipQOOxfSCRRCgW+Xz1b0uY/HSi+8Js
 O5yhYhiyY2aOwd3QRVT2pki8HWgaINFls/LkWeAUkM/oN3+hXKGevwZLHLOoJMPJRJzcXC2uR
 /HUmA1Vqj50QSLHEmp0Sh6VgjbGE81AEyljIwUzriKWCYCDIJl40fP2MBB9OCi2XBkSBTNQPa
 J2wK8oRBkImGuzQY7HAA20pyiDM8ayPVPYa/p2pYjWMiugkGaVJEzo34GSX9l5henjras2Uj9
 cSAmNstcgLT8PkUk+mMQXXBl70XaYaobRyvNonICgkTVCtnSPCyYPutXf5sccxBUjaYAz+rdS
 coPKIX7w18EEDR5FA6ni3Qc+NN7A+N6tKcE8XEQPcPzOLjqEG+DNwG3U8vx8NFlxTU6neyzM5
 5mBdBX0dDQZxp1/yW8W0Y0pKZqHAuGv0ABYqJ+WGOIriep6z9sXMPyX0/BjhcbCLCOpeuG7Pm
 Kzy6z+t6cjeHdYRp5qqi76ThhqFVA/bsiFEPKjUFt02wtJXfr5TTMFIJXA/zqO124CV1DTfCi
 RM798G1Z8gi/cO+tq5x9RHkbmvInADQIp32kRaezi+5kl16qxzG+wBsRm76el8dYMSe2bhkEj
 MSk8cSqts8TSaMbpj04wwfTqZRh8RLyDbZdqlGTDGw8sLEvJAWzEqoPzIs96CJ03Ot+7aTwCj
 TYrfi+RCu73EsXwp4cpRYtVn5ykXlSLTxxLoWk6e4kmsrSzXHKvDmd2EnLaNYVMEiHMw2hvsh
 Et4El1nOBCSDqzB5Irl1oMpzvq+okhTlj7F6zBpiw/ywgiPaZygLvy9PzeCm6VCTW4QK5bB6W
 V8zOYBJ0DvvlG+o908L5AnL4gmeHC2qkAEn06o8y6o79TRcK6vmCf8x2fgjMa2MDvV7xCLFqL
 VRPYLCXfxq5aUOwetwNUG+laYS/EOcs60MFFWcPBFL56RKfsuIxUo0JB5qG4HoJK2lOpHGETs
 hUnhhGwiZ6vozR6HQztKRnwV4otYsKXU/xvtY6vxbGYHSaOK908zzdLPMTBJdgKuEtAXCO1tl
 R+xzn+QVBlazWdrOOSJPDWbWBgabwGshYeAQeggTbIhkQEriPC2oFlyWce67Bv8yz/VdiqY1q
 Ju+BAOsoB17+ny0X/IwbTyWrGGws3nwCH/Z5TvKMB2fdZGhvq6urvoG0j4cYdR9SyVUDEXUrE
 +teMX79PiqRCdfVE6F5YQP8wnd++VFvsIsy/32mx6XkGeC1NmAtvFjU6bZYkagzuqz53u7MJA
 +ijdth8RQHiJaUuw/ZBXotdTXqxo=
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, u-boot@lists.denx.de,
 Wei Ming Chen <jj251510319013@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Udit Agarwal <udit.agarwal@nxp.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Manish Tomar <Manish.Tomar@nxp.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Wasim Khan <wasim.khan@nxp.com>,
 Mathew McBride <matt@traverse.com.au>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Tien Fong Chee <tien.fong.chee@altera.com>, e@freeshell.de,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Adriano Cordova <adrianox@gmail.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@intel.com>,
 Lukas Funke <lukas.funke@weidmueller.com>,
 Robert Marko <robert.marko@sartura.hr>, Michal Simek <michal.simek@amd.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tang Yuantian <andy.tang@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Maks Mishin <maks.mishinfz@gmail.com>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 28.03.25 17:04, Tom Rini wrote:
> On Fri, Mar 28, 2025 at 02:26:39PM +0200, Ilias Apalodimas wrote:
>> On Fri, 28 Mar 2025 at 13:34, Simon Glass <sjg@chromium.org> wrote:
>>>
>>> Hi Ilias,
>>>
>>> On Thu, 27 Mar 2025 at 15:19, Ilias Apalodimas
>>> <ilias.apalodimas@linaro.org> wrote:
>>>>
>>>> Hi Simon
>>>>
>>>> On Thu, 27 Mar 2025 at 15:33, Simon Glass <sjg@chromium.org> wrote:
>>>>>
>>>>> Hi Ilias,
>>>>>
>>>>> On Wed, 26 Mar 2025 at 02:37, Ilias Apalodimas
>>>>> <ilias.apalodimas@linaro.org> wrote:
>>>>>>
>>>>>> Hi Heinrich,
>>>>>>
>>>>>> On Mon, 24 Mar 2025 at 19:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>>>>>>>
>>>>>>> On 17.03.25 14:38, Ilias Apalodimas wrote:
>>>>>>>
>>>>>>> %s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/
>>>>>>>
>>>>>>>> The EFI subsystem defines its own bounce buffer for devices that
>>>>>>>> can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
>>>>>>>> which can be reused instead of defining another symbol.
>>>>>>>> The only limitation for EFI is that we don't know how big the file a user
>>>>>>>> chooses to transfer is and as a result we can't depend on allocating the
>>>>>>>> memory from the malloc area, which can prove too small.
>>>>>>>>
>>>>>>>> So allocate an EFI buffer of the correct size and pass it to the DM,
>>>>>>>> which already supports bounce buffering via bounce_buffer_start_extalign()
>>>>>>>
>>>>>>> Looking at
>>>>>>>
>>>>>>>       if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {
>>>>>>>
>>>>>>> in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
>>>>>>> enabled by the device driver. Only the scsi drivers sets bb = true.
>>>>>>>
>>>>>>> Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
>>>>>>> to blk_desc")
>>>>>>>
>>>>>>> Which device-drivers of the boards mentioned below do actually need
>>>>>>> bounce buffering?
>>>>>>
>>>>>> Unfortunately, I don't have any of the hardware to test and I havent
>>>>>> worked with that platform much.
>>>>>> That 'bb' variable and the fact that EFI needs bigger allocations is
>>>>>> why I ended up allocationg properly aligned memory from the EFI
>>>>>> subsystem. But as Mark pointed out, the cache flush is a no go for
>>>>>> now, so I'll drop this and see if I find time to rework the bounce
>>>>>> buffer logic overall
>>>>>
>>>>> There was quite a bit of discussion about all this in the context of
>>>>> my attempt to just add a message to warn the user[1]
>>>>>
>>>>> We might consider adding an event to reserve memory before relocation,
>>>>> along with a way to discover (in board_r) where the memory was
>>>>> allocated. That would make the solution more generic.
>>>>
>>>> I am not sure what you are trying to solve here. The EFI bounce buffer
>>>> after the LMB patches can't overwrite memory, nor can it be
>>>> overwritten.
>>>
>>> I am thinking of we can create a single implementation of the
>>> bouncebuf logic which also works for EFI.
>>>
>>> I think the two sane things to do are:
>>> - restrict U-Boot to using memory below 4GB for platforms which have
>>> the DMA limitation
>>
>> You don't need that. The bounce buf code has a callback you can use to
>> define the limitations
>>
>>> - create (in board_f) a special region below 4GB for use with the
>>> bouncebuf logic
>>
>> The only problem with EFI is that you don't know how much memory it
>> needs and we can't use the existing memalign calls. So if we replace
>> that memalign in the bounce buffer code, with an lmb reservation we
>> have everything we need.
>
> It's not even an EFI problem is it? You could hit the same problem
> reading a file from a filesystem outside of EFI too. These specific
> SoCs just aren't heavily exercised is one of the challenges I think and
> so it's possible that we have a few things to yet improve in the
> bounce buffer code (which was added for other SoCs and done as generic
> enough starting point for others).
>

EFI or LMB allocate memory top down. So EFI applications have a good
chance of loading files into high memory. Other file-system operations
typically use predefined addresses line $loadaddr. This is why the
problem became more visible in EFI.

It is evident that the bounce-buffer functionality is not EFI specific
per se.

Best regards

Heinrich
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
