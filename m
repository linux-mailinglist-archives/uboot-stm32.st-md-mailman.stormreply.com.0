Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 219282BA50F
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Nov 2020 09:48:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6852EC56630;
	Fri, 20 Nov 2020 08:48:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E11ACC0692F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 08:48:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AK8g1RN017559; Fri, 20 Nov 2020 09:48:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eIeHI9sEdMvLZoyFcuJZToSQ9xBb+GTG26uA29xtac0=;
 b=OQQsOISpcvvYKkM4E93img1HsXaH5sWQw25vUuOq8rSiySEW5TJYfIuHC0dZzoY40YjD
 XoRoayXbJ1H2Penrx1E3A+asgAnPrzfWv3YfKqWkFoCuqgWh2sEcxsfMMcRV20vNOReb
 dNUkcNhtluMW9ZKn1lbsVzr1aDxsfhdVFnyafjapuovyoD720n/jnzsw/mVlfF6OpZ1d
 mhM0PAltTLIEmB+DdoUhP7Oj7UEvFa/my8qxM4crSBekhhc0FhUdr/ve2bGUvvBtbJoB
 JvuVuVRHFgNnmYqGw1XpCCgih0/eXTrkf6QRbF0abM8DltIAtA8mw8jGo+dczDPgxPLt 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5w2crsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 09:48:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F29F10002A;
 Fri, 20 Nov 2020 09:48:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D2E1233E2A;
 Fri, 20 Nov 2020 09:48:46 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Nov 2020 09:48:45
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 Nov 2020 09:48:33 +0100
Message-ID: <20201120084833.31845-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_03:2020-11-19,
 2020-11-20 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] sandbox: remove ram buffer file when U-Boot
	is loaded by SPL
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

Update management of "--rm_memory" sandbox's option and force
this option when U-Boot is loaded by SPL in os_spl_to_uboot()
and remove the ram file after reading in main() as described
in option help message: "Remove memory file after reading".

This patch avoids that the file "/tmp/u-boot.mem.XXXXXX" [created in
os_jump_to_file() when U-Boot is loaded by SPL] is never deleted
because state_uninit() is not called after U-Boot execution
(CtrlC or with running pytest for example).

This issue is reproduced by
> build-sandbox_spl/spl/u-boot-spl
  and CtrlC in U-Bot console

> make qcheck

One temp file is created after each SPL and U-Boot execution
(7 tims in qcheck after test_handoff.py, test_ofplatdata.py,
 test_spl.py execution).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/sandbox/cpu/os.c    | 5 +++++
 arch/sandbox/cpu/start.c | 7 +++++++
 arch/sandbox/cpu/state.c | 4 ----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/sandbox/cpu/os.c b/arch/sandbox/cpu/os.c
index 0d8efd83f6..cd0e3b914e 100644
--- a/arch/sandbox/cpu/os.c
+++ b/arch/sandbox/cpu/os.c
@@ -750,6 +750,11 @@ int os_find_u_boot(char *fname, int maxlen)
 
 int os_spl_to_uboot(const char *fname)
 {
+	struct sandbox_state *state = state_get_current();
+
+	printf("%s\n", __func__);
+	/* U-Boot will delete ram buffer after read: "--rm_memory"*/
+	state->ram_buf_rm = true;
 	return os_jump_to_file(fname);
 }
 
diff --git a/arch/sandbox/cpu/start.c b/arch/sandbox/cpu/start.c
index a03e5aa0b3..be43baa338 100644
--- a/arch/sandbox/cpu/start.c
+++ b/arch/sandbox/cpu/start.c
@@ -447,6 +447,13 @@ int main(int argc, char *argv[])
 	if (os_parse_args(state, argc, argv))
 		return 1;
 
+	/* Remove old memory file if required */
+	if (state->ram_buf_rm && state->ram_buf_fname) {
+		os_unlink(state->ram_buf_fname);
+		state->write_ram_buf = false;
+		state->ram_buf_fname = NULL;
+	}
+
 	ret = sandbox_read_state(state, state->state_fname);
 	if (ret)
 		goto err;
diff --git a/arch/sandbox/cpu/state.c b/arch/sandbox/cpu/state.c
index 59f37fab0b..b2901b7a8c 100644
--- a/arch/sandbox/cpu/state.c
+++ b/arch/sandbox/cpu/state.c
@@ -415,10 +415,6 @@ int state_uninit(void)
 		}
 	}
 
-	/* Remove old memory file if required */
-	if (state->ram_buf_rm && state->ram_buf_fname)
-		os_unlink(state->ram_buf_fname);
-
 	/* Delete this at the last moment so as not to upset gdb too much */
 	if (state->jumped_fname)
 		os_unlink(state->jumped_fname);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
