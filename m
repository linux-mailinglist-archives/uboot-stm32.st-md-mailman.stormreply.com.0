Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283D2579A
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 20:33:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3995C6333C
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 18:32:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31DACC3F931
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 18:32:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LIVW6K013561; Tue, 21 May 2019 20:32:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Jc0hychjd4C3nhnOjTaxmgpPmBZaWuiUjeeA+U2xTv8=;
 b=JVtjSFyLhxNVdA5Q5N4dwEPkJZ5ytxDhVo+279i28rPrcLVNs9E4ECgWWkSHod1ApPb/
 //pzOUcehuOX5tl4ZBn4aSOyvust5plNMXLFEeUxpSNKoiwwiH4z9gGabgkPtiqScnzU
 JDcF0mQ51T97PDfxOOkXhdM0nmWqhOs0XB0ySmwcRNsc+qeNNn0+BVuQ2P9YeJDbYSN2
 SCDBRWzcuKxC78G2QjwawzL7HrzB/W1Pl6PcV4vpp2is4AjK7IIQzy4Du502AxAMEfjw
 yeQrZUaRp6ZAJZkWDjuyF63iFhODXHbofyurxmbGw0P8OuNrGWVB0R2E0MRuSdvkRogz MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0udny-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 20:32:53 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 116E331;
 Tue, 21 May 2019 18:32:51 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D722150D3;
 Tue, 21 May 2019 18:32:50 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 20:32:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Tue, 21 May 2019 20:32:50 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [U-Boot] [PATCH v2 4/8] test: py: add option to select device
 tree used during compilation
Thread-Index: AQHVDwv62c4uksFpcE+F5gXOyvf9b6Z1ovQAgAAxqkA=
Date: Tue, 21 May 2019 18:32:50 +0000
Message-ID: <175631bffa4b40f38234fd328dcdc1a4@SFHDAG6NODE3.st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-5-git-send-email-patrick.delaunay@st.com>
 <ac06f0cd-27cf-5878-f8f6-b2bcc5570e05@wwwdotorg.org>
In-Reply-To: <ac06f0cd-27cf-5878-f8f6-b2bcc5570e05@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>, Igor Opaniuk <igor.opaniuk@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 4/8] test: py: add option to
 select device tree used during compilation
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

Hi Stephen,

For information after the remarksSimon's  remark, 
I simplify the test, so this part is no more needed
See http://patchwork.ozlabs.org/patch/1102938/

But I will answer with my status and my tests done on the python code.

> 
> On 5/20/19 7:00 AM, Patrick Delaunay wrote:
> > Only used for spl compilation which include the device tree (with
> > platdata or embedded device tree).
> > For U-boot, test use config.dtb, by default :
> >     "build_dir + '/arch/sandbox/dts/test.dtb'"
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> > I need to force o_dt = 'all' to avoid make error:
> >
> > make: *** empty string invalid as file name.  Stop.
> >
> > But, I don't sure that it is the better solution for pytest.
> 
> This feels a bit odd. What board are you compiling for? I would expect the same
> compilation commands to "just work" for all boards, and would initially claim that if
> they don't, it's a bug in the makefiles that should be fixed there.

Yes, it is strange.

When I compile the board I have not the problem, I have issue only when I use pytest.

For example:

./test/py/test.py --bd sandbox_spl --build --device-tree sandbox -k 'test_000_version'
+make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox_spl -s sandbox_spl_defconfig
+make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox_spl DEVICE_TREE=sandbox -s -j8

=> it tis OK

./test/py/test.py --bd sandbox --build  -k 'test_000_version'
+make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox -s sandbox_defconfig
+make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox all -s -j8

=> it is OK

But if I use =

        if build_dir != source_dir:
            o_opt = 'O=%s' % build_dir
        else:
            o_opt = 'all'

        if device_tree:
            o_dt = 'DEVICE_TREE=%s' % device_tree
        else:
            o_dt = ''

Same result for the first command : 
	./test/py/test.py --bd sandbox --build  -k 'test_000_version'
	=> it is OK

But the second command I have got the next error:

./test/py/test.py --bd sandbox --build  -k 'test_000_version'
+make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox -s sandbox_defconfig
+make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox  -s -j8
make: *** empty string invalid as file name.  Stop.
Exit code: 2
INTERNALERROR> Traceback (most recent call last):
INTERNALERROR>   File "/usr/lib/python2.7/dist-packages/_pytest/main.py", line 86, in wrap_session
INTERNALERROR>     config._do_configure()
INTERNALERROR>   File "/usr/lib/python2.7/dist-packages/_pytest/config.py", line 830, in _do_configure
INTERNALERROR>     self.hook.pytest_configure.call_historic(kwargs=dict(config=self))
INTERNALERROR>   File "/usr/lib/python2.7/dist-packages/_pytest/vendored_packages/pluggy.py", line 729, in call_historic
INTERNALERROR>     self._hookexec(self, self._nonwrappers + self._wrappers, kwargs)
INTERNALERROR>   File "/usr/lib/python2.7/dist-packages/_pytest/vendored_packages/pluggy.py", line 338, in _hookexec
INTERNALERROR>     return self._inner_hookexec(hook, methods, kwargs)
INTERNALERROR>   File "/usr/lib/python2.7/dist-packages/_pytest/vendored_packages/pluggy.py", line 333, in <lambda>
INTERNALERROR>     _MultiCall(methods, kwargs, hook.spec_opts).execute()
INTERNALERROR>   File "/usr/lib/python2.7/dist-packages/_pytest/vendored_packages/pluggy.py", line 596, in execute
INTERNALERROR>     res = hook_impl.function(*args)
INTERNALERROR>   File "/local/home/frq07632/views/u-boot/u-boot/test/py/conftest.py", line 148, in pytest_configure
INTERNALERROR>     runner.run(cmd, cwd=source_dir)
INTERNALERROR>   File "/local/home/frq07632/views/u-boot/u-boot/test/py/multiplexed_log.py", line 173, in run
INTERNALERROR>     raise exception
INTERNALERROR> Exception: Exit code: 2


Moreover when I execute the command manually (without python), the compilation is accepted.... 

$> make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox -s sandbox_defconfig
$> make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox  -s -j8


I also try: 

        options = []
        if build_dir != source_dir:
            options.append('O=%s ' % build_dir)
        if device_tree:
            options.append('DEVICE_TREE=%s ' % device_tree)
        o_opt = ' '.join(options)

        cmds = (
            ['make', o_opt, '-s', board_type + '_defconfig'],
            ['make', o_opt, '-s', '-j8'],
        )


Then the o_opt is correctly build but the DEVICE_TREE option is not used when the build is requested by python(it is done manually)

make O=/local/home/frq07632/views/u-boot/u-boot/build-sandbox_spl  DEVICE_TREE=bad  -s -j8

Device Tree Source is not correctly specified.
Please define 'CONFIG_DEFAULT_DEVICE_TREE'
or build with 'DEVICE_TREE=<device_tree>' argument

./test/py/test.py --bd sandbox_spl --build --device-tree bad -k 'test_000_version'

=> no error !

> > diff --git a/test/py/conftest.py b/test/py/conftest.py
> 
> > +        if device_tree:
> > +            o_dt = 'DEVICE_TREE=%s' % device_tree
> > +        else:
> > +            o_dt = 'all'
> 
> You might want to make o_dt be a list that's either empty or contains one string.
> Then ...
> 
> >           cmds = (
> >               ['make', o_opt, '-s', board_type + '_defconfig'],
> > -            ['make', o_opt, '-s', '-j8'],
> > +            ['make', o_opt, o_dt, '-s', '-j8'],
> >           )
> 
> ... you can modify that line so that it doesn't add any additional options if o_dt is
> empty, so there's no change to the command-line except in the case where a DT
> is specified, to avoid the potential for any change to the existing flow:
> 
>              ['make', o_opt, *o_dt, '-s', '-j8'],

Not OK for my setup :

./test/py/test.py --bd sandbox_spl --build --device-tree sandbox -k 'test_000_version'

Traceback (most recent call last):
  File "/usr/lib/python2.7/dist-packages/_pytest/config.py", line 319, in _importconftest
    mod = conftestpath.pyimport()
  File "/usr/lib/python2.7/dist-packages/py/_path/local.py", line 650, in pyimport
    __import__(modname)
  File "/local/home/frq07632/views/u-boot/u-boot/test/py/conftest.py", line 143
    ['make', o_opt, *o_dt, '-s', '-j8'],
                    ^
SyntaxError: invalid syntax
ERROR: could not load /local/home/frq07632/views/u-boot/u-boot/test/py/conftest.py

> or:
> 
>              ['make', o_opt, '-s', '-j8'] + o_dt,

Also invalid (mising list and string.

So I am lost with my poor level of python.....

The only working test is :

    if config.getoption('build'):
        if build_dir != source_dir:
            o_opt = 'O=%s' % build_dir
        else:
            o_opt = ''

        cmds = (
            ['make', o_opt, '-s', board_type + '_defconfig'],
            ['make', o_opt, '-s', '-j8'],
        )
        if device_tree:
            cmds[1].append('DEVICE_TREE=%s' % device_tree)


So command with 'empty' string in cmds list for "make" cause the error ?

Anyway this patch is dropped in v3, I don't investigate more.

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
