Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6373B3750FA
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 May 2021 10:38:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19AF3C5718F;
	Thu,  6 May 2021 08:38:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A9D1C32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 May 2021 08:38:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1468bI4U028917; Thu, 6 May 2021 10:38:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uB9DeqRqaC+u8VK71osP1TnSTtyi+xF4UHe3nfdwPYE=;
 b=8MPO7O6uyIV4LHxiQxjDXhzDsONgom1zOchBXZoABuNPEafHNmQNsHPlMRTH+NbuoezG
 w5TjZYwFi0vtdeJKQv8rvhCqoWe/bVYkorljXbHF3O0IqZzMH3u+QUMiHPyVSc/a6bD7
 xG7vBH9oCDgh5ZpbkfDQDHD30Rv7jV7Yp5lAy00kjqFJcITcQEq5k4zvRnygZ3UhF+CN
 zSFGOsl60RBux13pUpA/YS0nhrn5PrSHxjPDbSSBY8W1mmbZd6KUtIR0/izlwgeGDOUV
 77YGkx0GGSq1DiUROGaZFCFUp4xDY6YrOH6tVrwBnESr6/3kTMDkEhU15ODUpgpxjXZJ LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38c9gssdq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 10:38:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC9F610002A;
 Thu,  6 May 2021 10:38:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E76921EAAD;
 Thu,  6 May 2021 10:38:07 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 10:38:07 +0200
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <20201028100640.13876-2-patrick.delaunay@st.com>
 <CAPnjgZ1wjs6t7G=oYArzc9j7P-KHg4BsVeLcmRzn2mogeEP05g@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <67cc4f09-85cd-c145-c851-faf153c1de8d@foss.st.com>
Date: Thu, 6 May 2021 10:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1wjs6t7G=oYArzc9j7P-KHg4BsVeLcmRzn2mogeEP05g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_06:2021-05-05,
 2021-05-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, U-Boot Mailing
 List <u-boot@lists.denx.de>, Sean Anderson <seanga2@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 4/29/21 6:10 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Wed, 28 Oct 2020 at 03:06, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>> Allow pin name parameter for pimux staus command,
>> as gpio command to get status of one pin.
>>
>> The possible usage of the command is:
>>
>>> pinmux dev pinctrl
>>> pinmux status
>>> pinmux status -a
>>> pinmux status <pin-name>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>   cmd/pinmux.c                 | 41 +++++++++++++++++++++++++-----------
>>   test/py/tests/test_pinmux.py | 29 +++++++++++++++++++++++++
>>   2 files changed, 58 insertions(+), 12 deletions(-)
>>
>> diff --git a/cmd/pinmux.c b/cmd/pinmux.c
>> index af04c95a46..e096f16982 100644
>> --- a/cmd/pinmux.c
>> +++ b/cmd/pinmux.c
>> @@ -41,19 +41,20 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
>>          return CMD_RET_SUCCESS;
>>   }
>>
>> -static void show_pinmux(struct udevice *dev)
>> +static bool show_pinmux(struct udevice *dev, char *name)
> How about returning -ENOENT if there is no pin.


OK


>>   {
>>          char pin_name[PINNAME_SIZE];
>>          char pin_mux[PINMUX_SIZE];
>>          int pins_count;
>>          int i;
>>          int ret;
>> +       bool found = false;
>>
>>          pins_count = pinctrl_get_pins_count(dev);
>>
>>          if (pins_count < 0) {
>>                  printf("Ops get_pins_count not supported by %s\n", dev->name);
>> -               return;
>> +               return found;
> Here found will be false, so I think you are conflating different
> errors. Better to return pins_count in this case.
OK
>>          }
>>
>>          for (i = 0; i < pins_count; i++) {
>> @@ -61,43 +62,59 @@ static void show_pinmux(struct udevice *dev)
>>                  if (ret) {
>>                          printf("Ops get_pin_name error (%d) by %s\n",
>>                                 ret, dev->name);
>> -                       return;
>> +                       return found;
>>                  }
>> -
>> +               if (name && strcmp(name, pin_name))
>> +                       continue;
>> +               found = true;
>>                  ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
>>                  if (ret) {
>>                          printf("Ops get_pin_muxing error (%d) by %s in %s\n",
>>                                 ret, pin_name, dev->name);
>> -                       return;
>> +                       return found;
>>                  }
>>
>>                  printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
>>                         PINMUX_SIZE, pin_mux);
>>          }
>> +
>> +       return found;
>>   }
>>
>>   static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
>>                       char *const argv[])
>>   {
>>          struct udevice *dev;
>> +       char *name;
>> +       bool found = false;
>>
>>          if (argc < 2) {
>>                  if (!currdev) {
>>                          printf("pin-controller device not selected\n");
>>                          return CMD_RET_FAILURE;
>>                  }
>> -               show_pinmux(currdev);
>> +               show_pinmux(currdev, NULL);
>>                  return CMD_RET_SUCCESS;
>>          }
>>
>>          if (strcmp(argv[1], "-a"))
>> -               return CMD_RET_USAGE;
>> +               name = argv[1];
>> +       else
>> +               name = NULL;
>>
>>          uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
>> -               /* insert a separator between each pin-controller display */
>> -               printf("--------------------------\n");
>> -               printf("%s:\n", dev->name);
>> -               show_pinmux(dev);
>> +               if (!name) {
>> +                       /* insert a separator between each pin-controller display */
>> +                       printf("--------------------------\n");
>> +                       printf("%s:\n", dev->name);
>> +               }
>> +               if (show_pinmux(dev, name))
>> +                       found = true;
>> +       }
>> +
>> +       if (name && !found) {
>> +               printf("%s not found\n", name);
>> +               return CMD_RET_FAILURE;
>>          }
>>
>>          return CMD_RET_SUCCESS;
>> @@ -148,5 +165,5 @@ U_BOOT_CMD(pinmux, CONFIG_SYS_MAXARGS, 1, do_pinmux,
>>             "show pin-controller muxing",
>>             "list                     - list UCLASS_PINCTRL devices\n"
>>             "pinmux dev [pincontroller-name] - select pin-controller device\n"
>> -          "pinmux status [-a]              - print pin-controller muxing [for all]\n"
>> +          "pinmux status [-a | pin-name]   - print pin-controller muxing [for all | for pin-name]\n"
>>   )
>> diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
>> index b3ae2ab024..fbde1d99b1 100644
>> --- a/test/py/tests/test_pinmux.py
>> +++ b/test/py/tests/test_pinmux.py
>> @@ -82,3 +82,32 @@ def test_pinmux_status(u_boot_console):
>>       assert ('P6        : GPIO1 drive-open-drain.' in output)
>>       assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
>>       assert ('P8        : GPIO3 bias-disable.' in output)
>> +
>> +@pytest.mark.buildconfigspec('cmd_pinmux')
>> +@pytest.mark.boardspec('sandbox')
>> +def test_pinmux_status_pinname(u_boot_console):
>> +    """Test that 'pinmux status <pinname>' displays selected pin."""
>> +
>> +    output = u_boot_console.run_command('pinmux status a5')
>> +    assert ('a5        : gpio output .' in output)
>> +    assert (not 'pinctrl-gpio:' in output)
>> +    assert (not 'pinctrl:' in output)
>> +    assert (not 'a6' in output)
>> +    assert (not 'P0' in output)
>> +    assert (not 'P8' in output)
>> +
>> +    output = u_boot_console.run_command('pinmux status P7')
>> +    assert (not 'pinctrl-gpio:' in output)
>> +    assert (not 'pinctrl:' in output)
>> +    assert (not 'a5' in output)
>> +    assert (not 'P0' in output)
>> +    assert (not 'P6' in output)
>> +    assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
>> +    assert (not 'P8' in output)
>> +
>> +    output = u_boot_console.run_command('pinmux status P9')
>> +    assert (not 'pinctrl-gpio:' in output)
>> +    assert (not 'pinctrl:' in output)
>> +    assert (not 'a5' in output)
>> +    assert (not 'P8' in output)
>> +    assert ('P9 not found' in output)
> Can we write this test in C? We can use run_command()...see acpi.c


Any reason to prefer C test to python...

I just complete the existing pinmux tests.

For performance ?

other pinmux tests in already python should be migrate also ?


>> --
>> 2.17.1
>>
> Regards,
> Simon
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32


Reagards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
