Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7337B437E7B
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 21:19:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF98C5C85C;
	Fri, 22 Oct 2021 19:19:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6983FC5C857
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 19:19:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id e19so6766082edy.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWkBfw93OvfUbtH1S9TqOOy6MJAYS3dQ6npwv8GkHFg=;
 b=m7tUI4ffKAgjSvap5/MOJyRRT+oSlJPBv8ZzqgN6ofDH1ND5IzjRV18HpNu/dV2jFW
 Wwuo9HhoWfvCG8xBhYS8gUNZxwUdOpFxOpxUP7oq6q6qN0ktT9ecDOiyxSgOyP4RnXCZ
 iCXdWlq1Om6a5v+lAjKatcuTQjU8EGRpQknI50MVpFMTFZ04UO6+t97MY7NzFSm/jUvy
 JJ/RT5Rz8vCjQYak09BAZE6uBIDR3gMK5+I5BWc6CrA7k7F0STQuzYvtfbuBsUhpZx/J
 tJ/og+788u0bObPZYuKfeuwtYuaKjf4MO7OxXunaAAvXKHR1HSYTX3JaZSy3wk8+ih8T
 py+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWkBfw93OvfUbtH1S9TqOOy6MJAYS3dQ6npwv8GkHFg=;
 b=cvR+n/ScBwZsf45cGogqa4FSKEJiaL5+XBuOdY3V6kH74gpwPRchZzFTORSjXzeY6a
 dm6g9OLj8F+yDeXoGaNdml+KoU5MSX7ETow6ZxqX9gdurropPitk4FzHVtrtBqr0r4Mt
 4K3JLgeUO2SmCBb3Fw4XBY+TzCTOn1M3pfLhiTnW2UTmtshr0a55oHEUEzwOPsfIt1Ev
 VntIZjjkUUgNQ2cIBzP8UKJSX7FMrELyHLY09E7jYH+ePFYJz1UyfnolDzgU6ZGHgMgC
 ksGOwh56hIymP1mb6rcqrmDHhe/3zmW7ke19YrjqraNX46Isiur9ebz6nVzVzSFJmPBr
 Xvww==
X-Gm-Message-State: AOAM531Om9J5WpgMQ7m36Eng5932BpngKskDCRlc641If2G3ZlVjnZwK
 MzD9fe+sSMvTUh9eqwTN7bHxGmBBZ4o204I61vA=
X-Google-Smtp-Source: ABdhPJxIevQsEuXJ9PAW7hva8CqtJ01Wxz4BCQoLVr46pYnMmhhl/hJ8o1mcmCFtWzojdaws8MWmqs7wdeOpSVOpUS0=
X-Received: by 2002:a17:906:9b08:: with SMTP id
 eo8mr1856597ejc.50.1634930367754; 
 Fri, 22 Oct 2021 12:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
In-Reply-To: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 22 Oct 2021 14:19:16 -0500
Message-ID: <CAHCN7xJOtTDtF1BoNChO=_4OPmdPoJQ=zg3Of3y0RUJfrhabrQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] Question: LTO and failing objcopy in
	"u-boot-initial-env" target
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

On Fri, Oct 22, 2021 at 10:16 AM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
>
> I made tests with LTO option activated on stm32mp15 boards but if have a
> issue
>
> with the U-Boot target  "u-boot-initial-env" (this command used by YOCTO)
>
>
> $> make u-boot-initial-env
>
> ...
>
> GENENV  u-boot-initial-env
> arm-none-linux-gnueabihf-objcopy: env/common.o: can't dump section
> '.rodata.default_environment' - it does not exist: file format not
> recognized
> sed: can't read u-boot-initial-env: No such file or directory
> make[1]: *** [/local/home/frq07632/views/u-boot/Makefile:2315:
> u-boot-initial-env] Error 2
> make[1]: Leaving directory
> '/local/home/frq07632/views/build/stm32mp15_defconfig'
> make: *** [Makefile:177: sub-make] Error 2
>
>
> But I reproduced it with sandbox:
>
> $> make sandbox_defconfig
>
> $> make all
>
> $> make u-boot-initial-env
>
> ....
>
>    LTO     u-boot
>    OBJCOPY u-boot-nodtb.bin
>    COPY    u-boot.bin
>    GENENV  u-boot-initial-env
> objcopy: env/common.o: can't dump section '.rodata.default_environment'
> - it does not exist: file format not recognized
> sed: can't read u-boot-initial-env: No such file or directory
> make: *** [Makefile:2315: u-boot-initial-env] Error 2
>
>
>
> Do you already know this issue for other board which activate the LTO
> feature ?
>
> I don't see any remarks about this issue on mailing list.
>
> Today I am known how to solve this issue.

I ran this:

arm-linux-gnueabihf-objdump env/common.o -t |grep default_environment
|awk '{print $4}'

to generate the name of the section:
.gnu.lto_default_environment.188.408aacacdb8e4907

I modified the Makefile to search for default_environment, then use
output of that as a parameter to $OBJCOPY, and that appears to work.

=====
diff --git a/Makefile b/Makefile
index 5194e4dc78..a80cf94ba1 100644
--- a/Makefile
+++ b/Makefile
@@ -2303,7 +2303,7 @@ endif
        $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost

 quiet_cmd_genenv = GENENV  $@
-cmd_genenv = $(OBJCOPY) --dump-section .rodata.default_environment=$@
env/common.o; \
+cmd_genenv = $(OBJCOPY) --dump-section `${OBJDUMP} env/common.o -t
|grep default_environment |awk '{print $$4}'`=$@ env/common.o; \
        sed --in-place -e 's/\x00/\x0A/g' $@

 u-boot-initial-env: u-boot.bin
=====

...
make -f ./scripts/Makefile.build obj=arch/arm/dts dtbs
test -e arch/arm/dts/logicpd-torpedo-37xx-devkit.dtb || ( \
echo >&2; \
echo >&2 "Device Tree Source
(arch/arm/dts/logicpd-torpedo-37xx-devkit.dtb) is not correctly
specified."; \
echo >&2 "Please define 'CONFIG_DEFAULT_DEVICE_TREE'"; \
echo >&2 "or build with 'DEVICE_TREE=<device_tree>' argument"; \
echo >&2; \
/bin/false)
  cat u-boot-nodtb.bin dts/dt.dtb > u-boot-dtb.bin
  cp u-boot-dtb.bin u-boot.bin
  arm-linux-gnueabihf-objcopy --dump-section
`arm-linux-gnueabihf-objdump env/common.o -t |grep default_environment
|awk '{print $4}'`=u-boot-initial-env env/common.o; sed --in-place -e
's/\x00/\x0A/g' u-boot-initial-env

$ ls -l u-boot-initial-env
-rw-rw-r-- 1 aford aford 1202 Oct 22 14:16 u-boot-initial-env

I am not sure it's the right solution, but it appears to work for me
on a board that uses LTO.  I didn't try it with a board that doesn't
use LTO.

adam
>
>
> PS: The same command is executed in "scripts/get_default_envs.sh"
>
>
> Regards
>
> Patrick
>
>
>
> I am ussing gcc 10.2
>
> gcc version 10.2.1 20201103 (GNU Toolchain for the A-profile
> Architecture 10.2-2020.11 (arm-10.16))
>
>
> And the name of the section change with LTO: .gnu.lto_default_environment.*
>
> for exmaple:
>
>
> $> arm-none-linux-gnueabihf-objdump -x -g -S common.o
>
> common.o:     file format elf32-littlearm
> common.o
> architecture: armv7, flags 0x00000011:
> HAS_RELOC, HAS_SYMS
> start address 0x00000000
> private flags = 5000000: [Version5 EABI]
>
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>    0 .text         00000000  00000000  00000000  00000034  2**0
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE
>    1 .data         00000000  00000000  00000000  00000034  2**0
>                    CONTENTS, ALLOC, LOAD, DATA
>    2 .bss          00000000  00000000  00000000  00000034  2**0
>                    ALLOC
>    3 .gnu.debuglto_.debug_info 000010a5  00000000  00000000 00000034  2**0
>                    CONTENTS, RELOC, READONLY, EXCLUDE
>    4 .gnu.debuglto_.debug_abbrev 000002a1  00000000  00000000 000010d9  2**0
>                    CONTENTS, READONLY, EXCLUDE
>    5 .gnu.debuglto_.debug_line 00000214  00000000  00000000 0000137a  2**0
>                    CONTENTS, READONLY, EXCLUDE
>    6 .gnu.debuglto_.debug_str 000012e3  00000000  00000000 0000158e  2**0
>                    CONTENTS, READONLY, EXCLUDE
>    7 .gnu.lto_.profile.69d69ac49136740e 0000000b  00000000 00000000
> 00002871  2**0
>                    CONTENTS, READONLY, EXCLUDE
>    8 .gnu.lto_.icf.69d69ac49136740e 0000007b  00000000  00000000
> 0000287c  2**0
>                    CONTENTS, READONLY, EXCLUDE
>    9 .gnu.lto_.ipa_sra.69d69ac49136740e 0000008c  00000000 00000000
> 000028f7  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   10 .gnu.lto_.inline.69d69ac49136740e 000002bc  00000000 00000000
> 00002983  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   11 .gnu.lto_.jmpfuncs.69d69ac49136740e 0000031c  00000000 00000000
> 00002c3f  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   12 .gnu.lto_.pureconst.69d69ac49136740e 0000002f  00000000 00000000
> 00002f5b  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   13 .gnu.lto_.lto.69d69ac49136740e 00000008  00000000  00000000
> 00002f8a  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   14 .gnu.lto_default_environment.154.69d69ac49136740e 00000507
> 00000000  00000000  00002f92  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   15 .gnu.lto_env_htab.155.69d69ac49136740e 00000062  00000000 00000000
> 00003499  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   16 .gnu.lto_env_get_yesno.156.69d69ac49136740e 00000244 00000000
> 00000000  000034fb  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   17 .gnu.lto_env_get_default.157.69d69ac49136740e 000003dc 00000000
> 00000000  0000373f  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   18 .gnu.lto_env_set_default.158.69d69ac49136740e 000004bf 00000000
> 00000000  00003b1b  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   19 .gnu.lto_env_set_default_vars.159.69d69ac49136740e 000001c1
> 00000000  00000000  00003fda  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   20 .gnu.lto_env_import.160.69d69ac49136740e 00000582  00000000
> 00000000  0000419b  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   21 .gnu.lto_env_check_redund.162.69d69ac49136740e 0000088a 00000000
> 00000000  0000471d  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   22 .gnu.lto_env_import_redund.163.69d69ac49136740e 00000461 00000000
> 00000000  00004fa7  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   23 .gnu.lto_env_export.164.69d69ac49136740e 000003a0  00000000
> 00000000  00005408  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   24 .gnu.lto_env_relocate.165.69d69ac49136740e 00000231  00000000
> 00000000  000057a8  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   25 .gnu.lto_env_complete.166.69d69ac49136740e 00000880  00000000
> 00000000  000059d9  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   26 .gnu.lto_env_relocate.part.0.203.69d69ac49136740e 000001ab
> 00000000  00000000  00006259  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   27 .gnu.lto_.symbol_nodes.69d69ac49136740e 000001f2  00000000
> 00000000  00006404  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   28 .gnu.lto_.refs.69d69ac49136740e 0000004f  00000000  00000000
> 000065f6  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   29 .gnu.lto_.decls.69d69ac49136740e 00001fbf  00000000  00000000
> 00006645  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   30 .gnu.lto_.symtab.69d69ac49136740e 000002de  00000000 00000000
> 00008604  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   31 .gnu.lto_.ext_symtab.69d69ac49136740e 00000039  00000000 00000000
> 000088e2  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   32 .gnu.lto_.opts 000001d6  00000000  00000000  0000891b  2**0
>                    CONTENTS, READONLY, EXCLUDE
>   33 .comment      0000005e  00000000  00000000  00008af1  2**0
>                    CONTENTS, READONLY
>   34 .note.GNU-stack 00000000  00000000  00000000  00008b4f  2**0
>                    CONTENTS, READONLY
>   35 .ARM.attributes 00000031  00000000  00000000  00008b4f  2**0
>                    CONTENTS, READONLY
> SYMBOL TABLE:
> 00000000 l    df *ABS*    00000000 common.c
> 00000000 l    d  .text    00000000 .text
> 00000000 l    d  .data    00000000 .data
> 00000000 l    d  .bss    00000000 .bss
> 00000000 l    d  .gnu.debuglto_.debug_info    00000000
> .gnu.debuglto_.debug_info
> 00000000 l    d  .gnu.debuglto_.debug_abbrev    00000000
> .gnu.debuglto_.debug_abbrev
> 00000000 l    d  .gnu.debuglto_.debug_line    00000000
> .gnu.debuglto_.debug_line
> 00000000 l    d  .gnu.debuglto_.debug_str    00000000
> .gnu.debuglto_.debug_str
> 00000000 l    d  .gnu.lto_.profile.69d69ac49136740e    00000000
> .gnu.lto_.profile.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.icf.69d69ac49136740e    00000000
> .gnu.lto_.icf.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.ipa_sra.69d69ac49136740e    00000000
> .gnu.lto_.ipa_sra.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.inline.69d69ac49136740e    00000000
> .gnu.lto_.inline.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.jmpfuncs.69d69ac49136740e    00000000
> .gnu.lto_.jmpfuncs.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.pureconst.69d69ac49136740e    00000000
> .gnu.lto_.pureconst.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.lto.69d69ac49136740e    00000000
> .gnu.lto_.lto.69d69ac49136740e
> 00000000 l    d .gnu.lto_default_environment.154.69d69ac49136740e
> 00000000 .gnu.lto_default_environment.154.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_htab.155.69d69ac49136740e00000000
> .gnu.lto_env_htab.155.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_get_yesno.156.69d69ac49136740e 00000000
> .gnu.lto_env_get_yesno.156.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_get_default.157.69d69ac49136740e 00000000
> .gnu.lto_env_get_default.157.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_set_default.158.69d69ac49136740e 00000000
> .gnu.lto_env_set_default.158.69d69ac49136740e
> 00000000 l    d .gnu.lto_env_set_default_vars.159.69d69ac49136740e
> 00000000 .gnu.lto_env_set_default_vars.159.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_import.160.69d69ac49136740e 00000000
> .gnu.lto_env_import.160.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_check_redund.162.69d69ac49136740e 00000000
> .gnu.lto_env_check_redund.162.69d69ac49136740e
> 00000000 l    d .gnu.lto_env_import_redund.163.69d69ac49136740e
> 00000000 .gnu.lto_env_import_redund.163.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_export.164.69d69ac49136740e 00000000
> .gnu.lto_env_export.164.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_relocate.165.69d69ac49136740e 00000000
> .gnu.lto_env_relocate.165.69d69ac49136740e
> 00000000 l    d  .gnu.lto_env_complete.166.69d69ac49136740e 00000000
> .gnu.lto_env_complete.166.69d69ac49136740e
> 00000000 l    d .gnu.lto_env_relocate.part.0.203.69d69ac49136740e
> 00000000 .gnu.lto_env_relocate.part.0.203.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.symbol_nodes.69d69ac49136740e 00000000
> .gnu.lto_.symbol_nodes.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.refs.69d69ac49136740e    00000000
> .gnu.lto_.refs.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.decls.69d69ac49136740e    00000000
> .gnu.lto_.decls.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.symtab.69d69ac49136740e    00000000
> .gnu.lto_.symtab.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.ext_symtab.69d69ac49136740e    00000000
> .gnu.lto_.ext_symtab.69d69ac49136740e
> 00000000 l    d  .gnu.lto_.opts    00000000 .gnu.lto_.opts
> 00000000 l    d  .note.GNU-stack    00000000 .note.GNU-stack
> 00000000 l    d  .comment    00000000 .comment
> 00000000 l    d  .ARM.attributes    00000000 .ARM.attributes
> 00000000  w      .gnu.debuglto_.debug_info    00000000 .hidden
> common.c.2c9afba8
> 00000001       O *COM*    00000001 __gnu_lto_slim
>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
