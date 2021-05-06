Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB537562C
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 May 2021 17:02:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6206C57B74;
	Thu,  6 May 2021 15:02:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65E1BC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 May 2021 15:02:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t18so5975062wry.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 May 2021 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvVIkFt8GUyV/D9TrnoH047Jzy7OLs3IsjaHeQM8qwM=;
 b=eKUdJye4R6P4Q8bsahSHAVGuXHDAyhTYZdri5rR1sZx/M7PuaBQaZXvVaer4XiIe75
 ej7P/6t4f5nvipoQo/Bww6X/E0dRsPtQQtiBadlPwcTK791fpFEDS7wg2kmM8mh3SZsK
 Jvs1yEonMv7hLIPnofJWdncxHOHTfPXEN+2fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvVIkFt8GUyV/D9TrnoH047Jzy7OLs3IsjaHeQM8qwM=;
 b=T4ZnKg0sM+ucUT8m9fihqEmLofqBqBUUT0fnCLuqNJ04K5OZxwSZmRw4U9QH9n7FB1
 rAN29+VcQbpmemz1Niv7cmnILxPiZvJigWv8T6r+mWiBFpxLS241QXojVqup6EV5VIvn
 MvS+qJdhKfNxUWsBLOiHPfO4f3qvPjItsgqNS1CTAQ+O5L4LHJAHg379hfioWMDaaFQC
 wuanBRFXIo7DUnEG3mJqx5d4vDKvd2QnzhbZBeq40c/6SRDN4IbRXchFMZ35I5+kXt3I
 hyl37oouJBkdeg+umA62s0MLLPJ0sPuGufKY8tLKwnEE8vEN5ANOTHBuQUmXg89i533R
 fOGw==
X-Gm-Message-State: AOAM531j0LcRXEk+Jp5+gzOu2wuPvLK5QvIRB3n0cErejiZIKaTzzk7Z
 M9zM2ZLk2czcija4ScamVsqHCQ1jMVKMvTZ9vxUCVA==
X-Google-Smtp-Source: ABdhPJxoT9rbRn8fxUXTcGZUTJe889bsIOeTCIvtRpD3nyQhUKkr90rrymKxfDLoZlyIIWQB4ocZz0H6BXEQnaCgaPk=
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr5947923wrr.56.1620313375603; 
 Thu, 06 May 2021 08:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <20201028100640.13876-2-patrick.delaunay@st.com>
 <CAPnjgZ1wjs6t7G=oYArzc9j7P-KHg4BsVeLcmRzn2mogeEP05g@mail.gmail.com>
 <67cc4f09-85cd-c145-c851-faf153c1de8d@foss.st.com>
In-Reply-To: <67cc4f09-85cd-c145-c851-faf153c1de8d@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 6 May 2021 09:02:40 -0600
Message-ID: <CAPnjgZ3E2-WALbbSqzOn=kWe_GDUM88urkC8GUNjU=NzFFC-aA@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in
	status command
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

On Thu, 6 May 2021 at 02:38, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi,
>
> On 4/29/21 6:10 PM, Simon Glass wrote:
> > Hi Patrick,
> >
> > On Wed, 28 Oct 2020 at 03:06, Patrick Delaunay <patrick.delaunay@st.com> wrote:
> >> Allow pin name parameter for pimux staus command,
> >> as gpio command to get status of one pin.
> >>
> >> The possible usage of the command is:
> >>
> >>> pinmux dev pinctrl
> >>> pinmux status
> >>> pinmux status -a
> >>> pinmux status <pin-name>
> >> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> >> ---
> >>
> >>   cmd/pinmux.c                 | 41 +++++++++++++++++++++++++-----------
> >>   test/py/tests/test_pinmux.py | 29 +++++++++++++++++++++++++
> >>   2 files changed, 58 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/cmd/pinmux.c b/cmd/pinmux.c
> >> index af04c95a46..e096f16982 100644
> >> --- a/cmd/pinmux.c
> >> +++ b/cmd/pinmux.c
> >> @@ -41,19 +41,20 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
> >>          return CMD_RET_SUCCESS;
> >>   }
> >>
> >> -static void show_pinmux(struct udevice *dev)
> >> +static bool show_pinmux(struct udevice *dev, char *name)
> > How about returning -ENOENT if there is no pin.
>
>
> OK
>
>
> >>   {
> >>          char pin_name[PINNAME_SIZE];
> >>          char pin_mux[PINMUX_SIZE];
> >>          int pins_count;
> >>          int i;
> >>          int ret;
> >> +       bool found = false;
> >>
> >>          pins_count = pinctrl_get_pins_count(dev);
> >>
> >>          if (pins_count < 0) {
> >>                  printf("Ops get_pins_count not supported by %s\n", dev->name);
> >> -               return;
> >> +               return found;
> > Here found will be false, so I think you are conflating different
> > errors. Better to return pins_count in this case.
> OK
> >>          }
> >>
> >>          for (i = 0; i < pins_count; i++) {
> >> @@ -61,43 +62,59 @@ static void show_pinmux(struct udevice *dev)
> >>                  if (ret) {
> >>                          printf("Ops get_pin_name error (%d) by %s\n",
> >>                                 ret, dev->name);
> >> -                       return;
> >> +                       return found;
> >>                  }
> >> -
> >> +               if (name && strcmp(name, pin_name))
> >> +                       continue;
> >> +               found = true;
> >>                  ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
> >>                  if (ret) {
> >>                          printf("Ops get_pin_muxing error (%d) by %s in %s\n",
> >>                                 ret, pin_name, dev->name);
> >> -                       return;
> >> +                       return found;
> >>                  }
> >>
> >>                  printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
> >>                         PINMUX_SIZE, pin_mux);
> >>          }
> >> +
> >> +       return found;
> >>   }
> >>
> >>   static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
> >>                       char *const argv[])
> >>   {
> >>          struct udevice *dev;
> >> +       char *name;
> >> +       bool found = false;
> >>
> >>          if (argc < 2) {
> >>                  if (!currdev) {
> >>                          printf("pin-controller device not selected\n");
> >>                          return CMD_RET_FAILURE;
> >>                  }
> >> -               show_pinmux(currdev);
> >> +               show_pinmux(currdev, NULL);
> >>                  return CMD_RET_SUCCESS;
> >>          }
> >>
> >>          if (strcmp(argv[1], "-a"))
> >> -               return CMD_RET_USAGE;
> >> +               name = argv[1];
> >> +       else
> >> +               name = NULL;
> >>
> >>          uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
> >> -               /* insert a separator between each pin-controller display */
> >> -               printf("--------------------------\n");
> >> -               printf("%s:\n", dev->name);
> >> -               show_pinmux(dev);
> >> +               if (!name) {
> >> +                       /* insert a separator between each pin-controller display */
> >> +                       printf("--------------------------\n");
> >> +                       printf("%s:\n", dev->name);
> >> +               }
> >> +               if (show_pinmux(dev, name))
> >> +                       found = true;
> >> +       }
> >> +
> >> +       if (name && !found) {
> >> +               printf("%s not found\n", name);
> >> +               return CMD_RET_FAILURE;
> >>          }
> >>
> >>          return CMD_RET_SUCCESS;
> >> @@ -148,5 +165,5 @@ U_BOOT_CMD(pinmux, CONFIG_SYS_MAXARGS, 1, do_pinmux,
> >>             "show pin-controller muxing",
> >>             "list                     - list UCLASS_PINCTRL devices\n"
> >>             "pinmux dev [pincontroller-name] - select pin-controller device\n"
> >> -          "pinmux status [-a]              - print pin-controller muxing [for all]\n"
> >> +          "pinmux status [-a | pin-name]   - print pin-controller muxing [for all | for pin-name]\n"
> >>   )
> >> diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
> >> index b3ae2ab024..fbde1d99b1 100644
> >> --- a/test/py/tests/test_pinmux.py
> >> +++ b/test/py/tests/test_pinmux.py
> >> @@ -82,3 +82,32 @@ def test_pinmux_status(u_boot_console):
> >>       assert ('P6        : GPIO1 drive-open-drain.' in output)
> >>       assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
> >>       assert ('P8        : GPIO3 bias-disable.' in output)
> >> +
> >> +@pytest.mark.buildconfigspec('cmd_pinmux')
> >> +@pytest.mark.boardspec('sandbox')
> >> +def test_pinmux_status_pinname(u_boot_console):
> >> +    """Test that 'pinmux status <pinname>' displays selected pin."""
> >> +
> >> +    output = u_boot_console.run_command('pinmux status a5')
> >> +    assert ('a5        : gpio output .' in output)
> >> +    assert (not 'pinctrl-gpio:' in output)
> >> +    assert (not 'pinctrl:' in output)
> >> +    assert (not 'a6' in output)
> >> +    assert (not 'P0' in output)
> >> +    assert (not 'P8' in output)
> >> +
> >> +    output = u_boot_console.run_command('pinmux status P7')
> >> +    assert (not 'pinctrl-gpio:' in output)
> >> +    assert (not 'pinctrl:' in output)
> >> +    assert (not 'a5' in output)
> >> +    assert (not 'P0' in output)
> >> +    assert (not 'P6' in output)
> >> +    assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
> >> +    assert (not 'P8' in output)
> >> +
> >> +    output = u_boot_console.run_command('pinmux status P9')
> >> +    assert (not 'pinctrl-gpio:' in output)
> >> +    assert (not 'pinctrl:' in output)
> >> +    assert (not 'a5' in output)
> >> +    assert (not 'P8' in output)
> >> +    assert ('P9 not found' in output)
> > Can we write this test in C? We can use run_command()...see acpi.c
>
>
> Any reason to prefer C test to python...
>
> I just complete the existing pinmux tests.
>
> For performance ?

I wrote this up here:

https://u-boot.readthedocs.io/en/latest/develop/tests_writing.html

>
> other pinmux tests in already python should be migrate also ?

They may as well be, to the extent that they only run on sandbox.

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
